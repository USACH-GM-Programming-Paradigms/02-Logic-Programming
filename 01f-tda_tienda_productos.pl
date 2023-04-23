% Tienda
% -----------
% Predicados

% store/3: constructor del TDA Tienda
% product/4: constructor del TDA Producto


% --------------
% Constructor Tienda

% store/3
% Domain: Name (str), Products (var), Store (var)
% e.g
% tienda("Gonzalo Market", Productos)
store(Name, Products, [Name, Products]).

% person("Gonzalo", "Usach", Person).
person(Name, University, [Name, University, Timestamp]) :-
   get_time(Timestamp).

% Constructor Producto
% product/4
% Domain: Name (str), Price (number), Stock (number), Product (var)
product(Name, Price, Stock, [Name, Price, Stock]).


% TDA Store
% getStoreName/2
% Domain: Store (var), Name (str)
% Primary Goal: getStoreName/2
% Secondary Goal: store/3
getStoreName(Store, Name) :-
   store(Name, _, Store).


% getStoreProducts/2
% Domain: Store (var), Products (var)
% Primary Goal: getStoreProducts/2
% Secondary Goal: store/3
getStoreProducts(Store, Products) :-
   store(_, Products, Store).


% addProductToProducts/3
% Domain: Store (var), Products (var)
% Primary Goal: addProductToProducts/3
% Secondary Goal: append/3
addProductToProducts(Product, Products, UpdatedProducts) :-
   append(Products, [Product], UpdatedProducts).


% setStoreProducts/3
% Domain: Store (var), UpdatedProducts (var), UpdatedStore (var)
% Primary Goal: setStoreProducts/3
% Secondary Goal: getStoreName/2, store/3
setStoreProducts(Store, UpdatedProducts, UpdatedStore) :-
   getStoreName(Store, Name),
   store(Name, UpdatedProducts, UpdatedStore).

% setProductPrice/3
% Domain: Product (var), NewPrice (int), UpdatedProduct (var)
% Primary Goal: setProductPrice/3
% Secondary Goal: product/3
setProductPrice(Product, NewPrice, UpdatedProduct) :-
   product(Name, _, Stock, Product),
   product(Name, NewPrice, Stock, UpdatedProduct).


% Agregar nuevo producto a tienda

% addProductToStore/3
% Domain: Product(var), Store(var), UpdatedStore(var)
% Primary Goal: addProductToStore/3
% Secundary Goal: getStoreProducts/2, addProductToProducts/3, setStoreProducts/3
addProductToStore(Product, Store, UpdatedStore) :-
   getStoreProducts(Store, Products),
   addProductToProducts(Product, Products, UpdatedProducts),
   setStoreProducts(Store, UpdatedProducts, UpdatedStore).


% updateProductPriceInProducts/4
% Domain: Product(var), Store(var), UpdatedStore(var)
% Primary Goal: addProductToStore/3
% Secundary Goal: getStoreProducts/2, addProductToProducts/3, setStoreProducts/3
% e.g.
%updateProductPriceInProductsByName('Product A', 10, [['Product A', 5, 10], ['Product B', 8, 5]], UpdatedProducts).
%updateProductPriceInProductsByName('Product B', 10, [['Product A', 5, 10], ['Product B', 8, 5]], UpdatedProducts).
%updateProductPriceInProductsByName('Product B', 10, [['Product A', 5, 10], ['Product B', 8, 5], ['Product C', 80, 51]], UpdatedProducts).

updateProductPriceInProductsByName(_, _, [], []) :- !.

updateProductPriceInProductsByName(Name, NewPrice,
              [ [Name, _, Stock] | Products],
              [ [Name, NewPrice, Stock] | UpdatedProducts]) :-
    updateProductPriceInProductsByName(Name, NewPrice, Products, UpdatedProducts).

updateProductPriceInProductsByName(Name, NewPrice,
              [ [OtherName, OtherPrice, OtherStock] | Products],
              [ [OtherName, OtherPrice, OtherStock] | UpdatedProducts]) :-
    updateProductPriceInProductsByName(Name, NewPrice, Products, UpdatedProducts).

% deleteProductFromProductsByName/3
% Domain: Product(var), Store(var), UpdatedStore(var)
% Primary Goal: addProductToStore/3
% Secundary Goal: getStoreProducts/2, addProductToProducts/3, setStoreProducts/3
% e.g.
%deleteProductFromProductsByName('Product A', [['Product A', 5, 10], ['Product B', 8, 5]], UpdatedProducts).

deleteProductFromProductsByName(_, [], []) :- !.

deleteProductFromProductsByName(Name, [ [Name, _, _] | Products], UpdatedProducts) :-
   deleteProductFromProductsByName(Name, Products, UpdatedProducts), !.

deleteProductFromProductsByName(Name, [Product | Products], [Product | UpdatedProducts]) :-
   deleteProductFromProductsByName(Name, Products, UpdatedProducts).

% findProductFromProductsByName/3
% Domain: Name(str), Products(List Product), FoundProduct(Product)
% Primary Goal: findProductFromProductsByName/3
% e.g.
% findProductFromProductsByName('Product A', [['Product A', 5, 10], ['Product B', 8, 5]], FoundProduct).
% findProductFromProductsByName('Product B', [['Product A', 5, 10], ['Product B', 8, 5]], FoundProduct).
findProductFromProductsByName(_, [], _) :- fail.
findProductFromProductsByName(Name, [ [Name, Price, Stock] | _], [Name, Price, Stock]) :- !.
findProductFromProductsByName(Name, [ [_, _, _] | Products], FoundProduct) :-
    findProductFromProductsByName(Name, Products, FoundProduct).

% updateProductPriceInStore/4
% Domain: ProductName (str), NewPrice (int), Store (var), UpdatedStore (var)
% Primary Goal: updateProductPriceInStore(ProductName, NewPrice, Store, UpdatedStore)
% También se puede escribir como: updateProductPriceInStore/4
% Secondary Goal: getStoreProducts/2, updateProductPriceInProductsByName/4, setStoreProducts/3
updateProductPriceInStore(ProductName, NewPrice, Store, UpdatedStore) :-
   getStoreProducts(Store, Products),
   updateProductPriceInProductsByName(ProductName, NewPrice, Products, UpdatedProducts),
   setStoreProducts(Store, UpdatedProducts, UpdatedStore).
  
% Delete product from store given his name
deleteProductFromStore(ProductName, Store, UpdatedStore) :-
   getStoreProducts(Store, Products),
   deleteProductFromProductsByName(ProductName, Products, UpdatedProducts),
   setStoreProducts(Store, UpdatedProducts, UpdatedStore).

% Query:
% store("Gonzalo Market", [], GonzaloMarket1),
% product("Guitar", 100, 3, ProductGuitar),
% addProductToStore(ProductGuitar, GonzaloMarket1, GonzaloMarket2),
% updateProductPriceInStore("Guitar", 800, GonzaloMarket2, GonzaloMarket3),
% product("Piano", 1000, 7, ProductPiano),
% addProductToStore(ProductPiano, GonzaloMarket3, GonzaloMarket4),
% updateProductPriceInStore("Piano", 8999, GonzaloMarket4, GonzaloMarket5),
% deleteProductFromStore("Guitar", GonzaloMarket5, GonzaloMarket6).
