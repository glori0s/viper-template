![TemplateIcon@2x](https://user-images.githubusercontent.com/60271542/154318808-e3572102-1406-4325-ac62-b90d99156b49.png)
# VIPER TEMPLATE
Xcode template used to generate VIPER module files
## Installation guide
- Clone repo
- Run from the root folder: `make install`
- To uninstall template, run: `make uninstall`
- Restart Xcode if it was already opened
## VIPER module structure
- _Protocols_: describes behavior of the module.
- _ViewController (View)_: displays what it is told to by the _Presenter_ and relays user input back to the _Presenter_. Contains only UI logic.
- _Presenter_: reacts to user inputs, requests data from _Interactor_ and prepares it for displaying.
- _Interactor_: contains the business logic as specified by a use case.
- _Router_: contains navigation logic.
- _Assembler_: assembles module.
