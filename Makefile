TEMPLATES_DIR=~/Library/Developer/Xcode/Templates
VIPER_TEMPLATE_DIR=Viper

install:
	rm -r -f $(TEMPLATES_DIR)/$(VIPER_TEMPLATE_DIR)
	mkdir -p $(VIPER_TEMPLATE_DIR)
	cp -r -f $(VIPER_TEMPLATE_DIR) $(TEMPLATES_DIR)

uninstall:
	rm -r -f $(TEMPLATES_DIR)/$(VIPER_TEMPLATE_DIR)
