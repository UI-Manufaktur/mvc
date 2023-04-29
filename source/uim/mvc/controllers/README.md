# Package 📦 uim.mvc.controllers


Controllers are invoked directly or indirectly by the router.  they are the first point of contact after a request.  each controller ends with a response.  

After routing is applied and the correct controller is found, the action of the found controller is invoked.  the controller should interpret the request data and ensure that the correct models are invoked and the correct response or view is rendered.  Controllers can be viewed as the controlling element between model and view.  to keep controllers lean, the reuse and use of components helps.  this approach also makes testing the code easier.
