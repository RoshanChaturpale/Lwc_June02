import { LightningElement, wire } from 'lwc';
import csvAccountData from '@salesforce/apex/accountData.csvAccountData';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Rating', fieldName: 'Rating', type: 'text' } // Picklist should be treated as text
];

export default class CsvComponent extends LightningElement {
    columns = columns;
    accountData = [];

    @wire(csvAccountData)
    wiredAccountData({ data, error }) {
        if (data) {
            this.accountData = data;
        } else if (error) {
            console.error('Error fetching account data:', error);
        }
    }

    get checkRecords() {
        return this.accountData.length === 0;
    }

    clickHandler() {
        let selectedRows = [];
        let downloadRecords = [];
        const datatable = this.template.querySelector('lightning-datatable');

        if (datatable) {
            selectedRows = datatable.getSelectedRows();
        }

        downloadRecords = selectedRows.length > 0 ? [...selectedRows] : [...this.accountData];

        if (downloadRecords.length > 0) {
            let csvFile = this.convertArrayToCsv(downloadRecords);
            this.createLinkForDownload(csvFile);
        } else {
            console.warn('No records available for download.');
        }
    }

    convertArrayToCsv(downloadRecords) {
        let csvHeader = Object.keys(downloadRecords[0]).join(',');
        let csvBody = downloadRecords.map(currItem => Object.values(currItem).join(',')).join('\n');

        return csvHeader + '\n' + csvBody;
    }

    createLinkForDownload(csvFile) {
        const downloadLink = document.createElement('a');
        downloadLink.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvFile);
        downloadLink.target = '_blank';
        downloadLink.download = 'AccountRecords.csv';
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }
}
