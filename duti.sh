## duti
# Set default app for file types/associations
# Useful for setting your default text editor for all file types
# To see the list of possible 

# REQUIREMENTS
# brew install duti

# Usage
# Set default app
# duti -s bundle_id { uti | url_scheme } [ role ]

# Get default app
# duti -x extension

duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.source-code all
duti -s com.microsoft.VSCode public.unix-executable all
duti -s com.microsoft.VSCode sh
duti -s com.microsoft.VSCode txt
duti -x sh
duti -x txt