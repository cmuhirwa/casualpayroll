--A TABLES
	--1 USERS:

		-- Add A user:
		INSERT INTO `users`(`name`, `email`, `phone`, `username`, `password`, `level`, `createdDate`, `createdBy`) 
		VALUES ('$name', '$email', '$phone', '$username', '$password', '$level', now(), 1)

	--2 CASUALS:
		
		-- Add a casual:
		INSERT INTO `casuals`(`name`, `phone`, `nid`, `categoryCode`, `branchCode`, `createDate`, `createdBy`) 
		VALUES ('$name', '$phone', '$nid', '$categoryCode', '$branchCode', now(), '$createdBy')
		--List casuals
		SELECT * FROM casuals WHERE --branchCode = '$branchId'
		-- Modify a user
		UPDATE casuals SET  name='$name', phone='$phone', nid='$nid', categoryCode='$categoryCode', branchCode='$branchCode', updatedDate=now(), updatedBy='$updatedBy'

	--3 CATEGORIES:
		
		-- Add A Category:
		INSERT INTO `categories`(`name`, `amount`, `condition`, `createdDate`, `createdBy`) 
		VALUES ('$name', '$amount', '$condition', now(), '$createdBy')
		-- List Categories:
		SELECT * FROM categories

	--4 BRANCHES:
		
		-- Add A Branch:
		INSERT INTO `branches`(`name`, `managerCode`, `createdDate`, `createdBy`) 
		VALUES ('$name', '$managerCode', now(), '$createdBy')
		-- List Branches:
		SELECT * FROM branches
		-- Update Branches:
		UPDATE branches SET name='$name', managerCode='$name', updatedDate=now(), updatedBy='$updatedBy'

	--5 TRANSACTIONS:

		-- Add A transaction:
		INSERT INTO `transactions`( `casualCode`, `categoryCode`, `multiples`, `payrollId`, `status`, `transactionId`, `createdDate`, `createdBy`)
		VALUES ('$casualCode', '$categoryCode', '$multiples', '$payrollId', '$status', '$transactionId', now(), '$createdBy')


--B VIEWS
	--1 List Emplayees
		CREATE VIEW casualview AS 
		SELECT cs.name, cs.phone, cs.nid, cs.categoryCode, cs.branchCode, ct.name categoty, ct.condition, ct.amount
		FROM casuals cs
		INNER JOIN  categories ct
		ON ct.id = cs.categoryCode
		WHERE 1
	
	--2 List PayrollTransactions
		CREATE VIEW payrollTransactions AS 
		SELECT cs.name , ct.name categoty, ct.condition, ct.amount, tr.multiples, 
		(ct.amount*tr.multiples) total, tr.payrollId, pr.payfrom, pr.payto, tr.status
		FROM transactions tr
		INNER JOIN casuals cs
		ON cs.id = tr.casualCode 
		INNER JOIN  categories ct
		ON ct.id = cs.categoryCode
		INNER JOIN payroll pr
		ON pr.id = tr.payrollId

	--3 List Payrolls
		CREATE VIEW Payrolls AS 
		SELECT payfrom, payto, payrollId, COUNT(name) casuals, SUM(total)
		FROM payrollTransactions
		GROUP BY payrollId