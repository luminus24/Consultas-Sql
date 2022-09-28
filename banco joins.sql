--Codigos de los joins

select clients.id, clients.first_name as nombre , clients.last_name as apellido, clients.email, accounts.account_no as cuenta, accounts.balance as saldo from clients left join accounts on clients.id = accounts.client_id;

select accounts.account_no as cuenta, account_types.id as id_cliente, account_types.name as tipo_cuenta from accounts left join account_types on accounts.type = account_types.id;

select transactions.id as transaction, transactions.amount as monto, transactions_types.name as tipo_de_transaccion from transactions left join transactions_types on transactions.transaction_type = transactions_types.id;

select transactions.id as transaction, transactions.amount as monto, transactions_types.name as tipo_de_transaccion from transactions right join transactions_types on transactions.transaction_type = transactions_types.id;

-- Codigos de las vistas

create view v_clients_accounts as select clients.id, clients.first_name as nombre , clients.last_name as apellido, clients.email, accounts.account_no as cuenta, accounts.balance as saldo from clients left join accounts on clients.id = accounts.client_id; 

create view v_accounts_types as select accounts.account_no as cuenta, account_types.id as id_cliente, account_types.name as tipo_cuenta from accounts left join account_types on accounts.type = account_types.id;

create view v_transactions_detail as select transactions.id as transaction, transactions.amount as monto, transactions_types.name as tipo_de_transaccion from transactions left join transactions_types on transactions.transaction_type = transactions_types.id;

create view v_transactions_types_detail as select transactions.id as transaction, transactions.amount as monto, transactions_types.name as tipo_de_transaccion from transactions right join transactions_types on transactions.transaction_type = transactions_types.id;