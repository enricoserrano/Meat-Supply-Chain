pragma solidity ^0.8.12;
pragma experimental ABIEncoderV2;
contract SupplierContract {
    uint public transactionCount = 0;
    mapping(uint => transaction) public transactions;

    struct transaction {
        uint transactionid;
        uint prodid;
        string prodname;
        string suppname;
        string supplocation;
        string actdone;
        string actdate;
    }

    function addTransaction(uint prodid, string memory prodname, string memory suppname, string memory supplocation, string memory actdone, string memory actdate) public {
        uint transactionCountIndex = transactionCount + 1;
        uint verifyIndexTransac = 0;
        for (uint i = 0; i < transactionCountIndex; i++) {
            transaction storage ts = transactions[i];
            if (ts.prodid == prodid) {
                verifyIndexTransac++;
            }
        }
            //These activities have to be fullfilled in order for transactions with same product ID to be created 
            //Registered -> Processed -> Distributed -> Retail

            //If a product is registered, it will be saved into the blockchain automatically since registration comes first and theres no dependencies
            if(bytes(actdone).length == bytes("Registered").length && verifyIndexTransac == 0) {
                incrementCount();
                transactions[transactionCount] = transaction(transactionCount, prodid, prodname, suppname, supplocation, actdone, actdate);
            //If a product is processed, it will only be saved into the blockchain if a product with the same product id is registered first.
            } else if (bytes(actdone).length == bytes("Processed").length && verifyIndexTransac == 1) {
                incrementCount();
                transactions[transactionCount] = transaction(transactionCount, prodid, prodname, suppname, supplocation, actdone, actdate);
            //If a product is distributed, it will only be saved into the blockchain if a product with the same product id is registered and processed
            } else if (bytes(actdone).length == bytes("Distributed").length && verifyIndexTransac == 2) {
                incrementCount();
                transactions[transactionCount] = transaction(transactionCount, prodid, prodname, suppname, supplocation, actdone, actdate);
            //If a product is retail, it will only be saved into the blockchain if a product with the same product id is registered, processed, and distributed
            } else if (bytes(actdone).length == bytes("Retail").length && verifyIndexTransac == 3) {
                incrementCount();
                transactions[transactionCount] = transaction(transactionCount, prodid, prodname, suppname, supplocation, actdone, actdate);
            }

    }

    function incrementCount() internal {
        transactionCount += 1;
    }

    function prodidsearch(uint prodidinput) public returns (string memory){
        //This value adds all transaction into one string 
        string memory text;
        //This value is useful and is being used in the foor loop to iterate through transaction array
        //uint index = 1;
        //A simple for the application to iterate through all the transaction since previously it leaves the last element out
        uint transactionCountIndex = transactionCount + 1;
        //These arrays stores the transaction activities of a product id that is entered by the user
        //string[] memory registrationTransaction = new string[](1);
        //string[] memory packingTransaction = new string[](1);
        //string[] memory distributionTransaction = new string[](1);
        //string[] memory retailTransaction = new string[](1);

        for (uint i = 0; i < transactionCountIndex; i++) {
            transaction storage ts = transactions[i];
            if (ts.prodid == prodidinput) {

            text = string.concat(text,'Product Name: ',ts.prodname, ' | ');
            text = string.concat(text,'Supplier Name: ', ts.suppname, ' | ');
            text = string.concat(text,'Supplier Location: ', ts.supplocation, ' | ');
            text = string.concat(text,'Activity Done: ',ts.actdone, ' | ');
            text = string.concat(text,'Date: ',ts.actdate, '~');

            /*
            //Puts the second transaction found against product id input into the registration array
            if(index == 1) {
                registrationTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the packing array
            } else if (index == 2) {
                packingTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the distribution array
            } else if (index == 3) {
                distributionTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the retail array
            } else if (index == 4) {
                retailTransaction[0] = text;
                index++;
                text = "";
            }*/

            }
        }
        return (text);
    }

    function contidsearch(uint prodidinput) public returns (string memory){
        //This value adds all transaction into one string 
        string memory text;
        //This value is useful and is being used in the foor loop to iterate through transaction array
        //uint index = 1;
        //A simple for the application to iterate through all the transaction since previously it leaves the last element out
        uint transactionCountIndex = transactionCount + 1;
        //These arrays stores the transaction activities of a product id that is entered by the user
        //string[] memory registrationTransaction = new string[](1);
        //string[] memory packingTransaction = new string[](1);
        //string[] memory distributionTransaction = new string[](1);
        //string[] memory retailTransaction = new string[](1);

        for (uint i = 0; i < transactionCountIndex; i++) {
            transaction storage ts = transactions[i];
            if (ts.prodid == prodidinput) {

            text = string.concat(text,ts.prodname, ' | ');
            text = string.concat(text,ts.suppname, ' | ');
            text = string.concat(text,ts.supplocation, ' | ');
            text = string.concat(text,ts.actdone, ' | ');
            text = string.concat(text,ts.actdate, '~');

            /*
            //Puts the second transaction found against product id input into the registration array
            if(index == 1) {
                registrationTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the packing array
            } else if (index == 2) {
                packingTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the distribution array
            } else if (index == 3) {
                distributionTransaction[0] = text;
                index++;
                text = "";
            //Puts the second transaction found against product id input into the retail array
            } else if (index == 4) {
                retailTransaction[0] = text;
                index++;
                text = "";
            }*/

            }
        }
        return (text);
    } 
}

