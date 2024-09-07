#Before running this script make sure to export the corresponding account id and varset id for pushing the right credentials
#Also give the right permisions to run this script with chmod, something like:
# chmod 755 login.sh

doormat login
doormat aws tf-push variable-set --account $ACCOUNT_ID --id $VARSET_ID