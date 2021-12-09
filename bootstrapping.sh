#!\bin\bash 

bootstrapped="false"

function bootstrapping() {
  bootstrapped=$(curl -X POST --data '{
      "jsonrpc":"2.0",
      "id"     :1,
      "method" :"info.isBootstrapped",
      "params": {
          "chain":"X"
      }
  }' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | grep -o "true")
}

bootstrapping
if [ "$bootstrapped" = "true" ];
then    
        echo "---------------------------------------"
        echo "--- Avalanche is fully bootstrapped ---"
		echo "---------------------------------------"
else    
        echo "---------------------------------------"
        echo "--- Avalanche is still bootstrapping---"
		echo "---------------------------------------"
fi  