public class LeadController {
    public Lead newLead { get; set; }
    public Task task1 { get; set; }
    public Task task2 { get; set; }

    public LeadController() {
        newLead = new Lead();
        task1 = new Task();
        task2 = new Task();
    }

    public PageReference createLeadAndTask() {
        System.debug('newLead: ' + newLead);

        try {
            insert newLead;

            // Check if the Lead status is changed to "Working - Contacted"
            if (newLead.Status == 'Working - Contacted') {
                // Create Task 1
                task1.WhoId = newLead.Id;
                task1.Subject = 'Follow-Up Call';
                task1.Status = 'Not Started';
                insert task1;

                // Create Task 2
                task2.WhoId = newLead.Id;
                task2.Subject = 'Send Information';
                task2.Status = 'Not Started';
                insert task2;
            }

            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Lead and Tasks created successfully.'));

            // Reset the values after successful creation
            newLead = new Lead();
            task1 = new Task();
            task2 = new Task();

            // Optionally, you can add a message for successful reset
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Form reset successfully.'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error creating Lead and Tasks: ' + e.getMessage()));
        }

        return null;
    }
}