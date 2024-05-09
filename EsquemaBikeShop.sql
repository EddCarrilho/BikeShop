-- Comando para criar um novo banco de dados.
CREATE DATABASE bikeshop;
-- Comando para selecionar o bando de dados criado
USE bikeshop;

create table inventario (
idinventario int auto_increment primary key,
modelo varchar(50) not null unique,
marca varchar(50) not null unique,
quantidade int not null,
preco decimal(6,2) not null,
idfornecedor int not null
);

create table cliente(
idcliente int auto_increment primary key,
nome varchar(50) not null,
endereco varchar(50) not null,
numerotelefone varchar(15) not null unique,
email varchar(100) not null
);

create table venda (
idvenda int auto_increment primary key,
data datetime default current_timestamp(),
idcliente int not null,
idinventario int not null,
quantidade int not null,
precototal decimal(7,2) not null,
metodopagamento enum("Dinheiro","Crédito","Débito","PIX"),
idvendedor int not null
);

create table fornecedor (
idfornecedor int auto_increment primary key,
nomefornecedor varchar(50) not null,
enderecofornecedor varchar(50) not null unique,
numerotelefonefornecedor varchar(15) not null unique,
emailfornecedor VARCHAR(100)
);

create table vendedor(
idvendedor INT auto_increment primary key,
nomevendedor VARCHAR(50),
idfuncionario int not null
);

create table funcionario (
idfuncionario int auto_increment primary key,
nomefuncionario varchar(50) not null,
cargo varchar(50) not null,
salario decimal(7,2) not null,
dataadmissao date not null
);

create table detalhevenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idinventario int not null,
quantidade int not null,
subtotal decimal(7,2) not null
);

-- Alterar a tabela para adicionar
-- Uma chave estrangeira e um relacionamento
-- Com a tabela

ALTER TABLE inventario
ADD CONSTRAINT `fk.inve_pk.forne`
fOREIGN KEY inventario (`idfornecedor`)
references fornecedor(`idfornecedor`);

alter table venda
add constraint `fk.venda_pk.cliente`
foreign key venda (`idcliente`)
references cliente (`idcliente`);

alter table venda
add constraint `fk.venda_pk.inventario`
foreign key venda (`idinventario`)
references inventario (`idinventario`);

alter table venda
add constraint `fk.venda_pk.vendedor`
foreign key venda (`idvendedor`)
references vendedor (`idvendedor`);

alter table vendedor
add constraint `fk.vendedor_pk.funci`
foreign key vendedor (`idfuncionario`)
references funcionario (`idfuncionario`);

alter table detalhevenda
add constraint `fk.dtvenda_pk.venda`
foreign key detalhevenda (`idvenda`)
references venda (`idvenda`);

alter table detalhevenda
add constraint `fk.dtvenda_pk.inventario`
foreign key detalhevenda (`idinventario`)
references inventario (`idinventario`);

