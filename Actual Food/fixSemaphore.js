//Initialize the semaphores object
//Add a constructor function we can use to add new semaphores.
semaphores={
	semaphoreConstructor: function(semaphoreName, initialState, initialStates){
		state=initialState;
		states=initialStates;
		semaphores[semaphoreName]= {
			changeState: function(newState){
        debugger
				if(state!==newState && semaphores.enabled===true){
          debugger
					console.log("changing state of semaphore " + semaphoreName + " from " + state + " to " + newState + ". Set semaphores.enabled=false to disable this.");
					states[state].leave();
					states[newState].enter();
					state=newState;
				}
			}
		}
	}
}


//Let's add some semaphores
semaphores.semaphoreConstructor("busyUploading", false, {
	true: {
		enter: function(){ $("#statusMessage").innerHTML("Upload in progress — please wait");
		//imagine there's some code here that locks out the UI
		}, //tell the user an upload is happening
		leave: function(){ $("#statusMessage").innerHTML("");
		//imagine there's some code here that re-enables the UI
		}
	},
	false: {
		enter: function(){},
		leave: function(){},
	}
});


semaphores.semaphoreConstructor("busyProcessing", false, {
	true: {
		enter: function(){ $("#statusMessage").innerHTML("Processing the photo you just uploaded"); }, //tell the user the image is being processed
		leave: function(){ $("#statusMessage").innerHTML(""); }
	},
	false: {
		enter: function(){},
		leave: function(){},
	}
});


//We might use this in the future by doing something like
//semaphores.busyUploading.changeState(true);





// busyUploading: it should lock the screen upon entering this state and re-enable after it leaves this state
// busyProcessing: it should lock the screen upon entering this state, and re-enable after it leaves this state
//
// line 9: if(state!==newState && semaphores.enabled===true)
// this says that if the state is different from the newState AND the semaphores.enabled is true, the code will execute
// since semaphores.enabled is never initialized, semaphores.enabled===true evaluates to false and our code neevr executes.
// the end of line 10 clearly suggests that semaphores.enabled should be initialized to true but can be set to false to disable this feature
//
// There is also a missing comma at the end of line 40
//
// I can't find the other problem
//
// It seems like the busyProcessing semaphore should also have //code to lock out and re-enable ui
// Perhaps after a photo is uploaded (and the sempahore state changes to false) the busyProcessing semaphore should be called automatically
