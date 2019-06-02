
#1
SELECT Branch_Address FROM Branch WHERE Branch_ID IN
         (SELECT Branch_ID FROM Has_Branch WHERE Bank_Code=(
           SELECT Bank_Code FROM Bank WHERE Bank_Name='Mellat')
         ) ;
#2
SELECT Client_Name,Client_Phone,Client_Address FROM Client WHERE Client_ID IN (SELECT Client_ID FROM Has_Account WHERE Account_Number IN (SELECT Account_Number FROM Account WHERE Account_Deposit>'1000000'));
#3
SELECT * FROM
  (SELECT Client_Name FROM Client C WHERE C.Client_ID IN (SELECT Client_ID FROM Has_Loan L WHERE L.Loan_ID IN (SELECT Loan_ID FROM Loan WHERE Loan_Credit=(SELECT MAX(Loan_Credit) FROM Loan)))) AS R1,
  (SELECT Loan_Credit FROM Loan WHERE Loan_Credit=(SELECT MAX(Loan_Credit) FROM Loan)) AS R2;
#4
SELECT Sum(Account_Deposit) FROM Account A WHERE A.Account_Number IN (SELECT Account_Number FROM Manages_Account M WHERE M.Branch_ID IN (SELECT Branch_ID FROM Has_Branch H WHERE H.Bank_Code=(SELECT Bank_Code FROM Bank WHERE Bank_Name='refah')));
#5
SELECT Account_Deposit FROM Account A WHERE A.Account_Number IN (SELECT Account_Number FROM Has_Account WHERE Client_ID=(SELECT Client_ID FROM Client WHERE Client_Name='Ali'));
#6
CREATE VIEW V1 AS SELECT Branch_ID,COUNT(DISTINCT Account_Number) AS Bcount FROM Manages_Account GROUP BY Branch_ID;
CREATE VIEW V2 AS SELECT B.Branch_Address,V.Branch_ID,V.Bcount FROM Branch B , V1 V WHERE B.Branch_ID=V.Branch_ID;
SELECT * FROM V2  WHERE Branch_ID IN (SELECT Branch_ID FROM Has_Branch WHERE Bank_Code IN (SELECT Bank_Code FROM Bank WHERE Bank_Name='Keshavarzi'));
#7
SELECT DISTINCT Loan_Type FROM Loan WHERE Loan_ID IN (SELECT Loan_ID FROM Manages_Loan WHERE Branch_ID IN (SELECT Branch_ID FROM Has_Branch WHERE Bank_Code=(SELECT Bank_Code FROM Bank WHERE Bank_Name='Maskan')));
#8
SELECT COUNT(Branch_ID) FROM Has_Branch WHERE Bank_Code=(SELECT Bank_Code FROM Bank WHERE Bank_Name='Ayande');
#9
SELECT Client_Address FROM Client WHERE Client_ID =(SELECT Client_ID FROM Has_Account WHERE Account_Number =(SELECT MAX(Account_Number) FROM Manages_Account WHERE Branch_ID IN (SELECT Branch_ID FROM Has_Branch WHERE Bank_Code =(SELECT Bank_Code FROM Bank WHERE Bank_Name='Sepah'))));
