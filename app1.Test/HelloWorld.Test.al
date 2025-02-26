codeunit 70000 "HelloWorld Test"
{
    Subtype = Test; //change

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        if (not MessageDisplayed) then
            ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world');
    end;

    var
        MessageDisplayed: Boolean;



    //**>> TEST TASK SCHEDULER
    // => in de github AL-Go-Settings.json moet een parameter worden toegevoegd: "enableTaskScheduler": true,
    //
    // daarna een testfunctie maken die een scheduled task aanmaakt met een codeunit die altijd een error geeft.
    // en dan een fail codeunit erbij maken die checkt of de task inderdaad in error is gegaan. 
    // Zo ja, dan werkt de Task Scheduler
    //
    //var
    //  ScheduledTaskID: Guid;
    //  NotBefore: DateTime;
    //if not TaskScheduler.CanCreateTask() then
    //    error('cannot create task');
    //NotBefore := CurrentDateTime;
    //ScheduledTaskID := TaskScheduler.CreateTask(80001, 0, false, '', NotBefore);
    //TaskScheduler.SetTaskReady(ScheduledTaskID, NotBefore);
    //
    // in combinatie met deze codeunit en daarbij zal dus ook nog een failure codeunit moeten komen om af te vragen of hij fout is gegaan of niet:
    //codeunit 80001 ScheduledTaskTest
    //{
    //    trigger OnRun()
    //    begin
    //        Error('Dit is de uitvoerende codeunit van de Scheduled Task!');
    //    end;
    //}
    //**
}

