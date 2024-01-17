sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'assignments/test/integration/FirstJourney',
		'assignments/test/integration/pages/AssignmentList',
		'assignments/test/integration/pages/AssignmentObjectPage'
    ],
    function(JourneyRunner, opaJourney, AssignmentList, AssignmentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('assignments') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAssignmentList: AssignmentList,
					onTheAssignmentObjectPage: AssignmentObjectPage
                }
            },
            opaJourney.run
        );
    }
);