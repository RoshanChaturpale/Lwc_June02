import { createElement } from 'lwc';
import Lds_Lightning_Record_Form from 'c/lds_Lightning_Record_Form';

describe('c-lds-lightning-record-form', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-lds-lightning-record-form', {
            is: Lds_Lightning_Record_Form
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});