Config = {
    NotifySubject = true, -- Set this to false if you want the person being tested to get a chat notification that they are being tested
    EnableCleanGSR = true, -- Set this to false if you dont want people to be able to clean gsr off them

    GSRAutoClean = 900, -- (IN SECONDS) Ammount Of Time Before GSR Auto Cleans [Default Is 15 Minutes]
    GSRTestDistance = 3, -- Maximum Distance That You Can Be To Test For GSR ***I Recomend Leaving This Low***

    TestGSR = "gsr", -- Command To Test For GSR
    CleanGSR = "cleangsr", -- Command To Clean GSR

    Text = {
        GettingTestedMsg = "^3You Have Been Tested For GSR By: ^2", -- The Message That Is Sent To The Person That Is Getting Tested
        TestedPositive = "Subject Tested ^1Positive ^rGSR", -- The Message The Tester Is Sent When Test Comes Back Positive
        TestedNegative = "Subject Tested ^2Negative ^rGSR", -- The Message The Tester Is Sent When Test Comes Back Negative
        AlreadyClean = "^3You Are Already Clean", -- The Message The Subject Gets If They Are Aleady Clean [NotifySubject] Must Be Set To True
        TCleaningGSR = "^2You Cleaned Gunshot Residue Off Your Hands", -- The Message The Subject Gets When They Are Cleaning Themselfs [NotifySubject] Must Be Set To True
        NoSubjectError = "^3Could Not Find Subject",
    },
}