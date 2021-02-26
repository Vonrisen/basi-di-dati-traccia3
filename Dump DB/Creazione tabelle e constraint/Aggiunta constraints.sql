-- Controllo degli indirizzi.

ALTER TABLE Customer
ADD CONSTRAINT customer_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[\x20-\xA5]+(, )[\x20-\xFF]+$' );

ALTER TABLE CustomerOrder
ADD CONSTRAINT customer_order_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[\x20-\xA5]+(, )[\x20-\xFF]+$' );

ALTER TABLE Rider
ADD CONSTRAINT rider_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[\x20-\xA5]+(, )[\x20-\xFF]+$' );

ALTER TABLE Shop
ADD CONSTRAINT shop_address_check CHECK (address~*'^(accesso|arco|belvedere|borgo|campo|canale|cascina|cavone|cavalcavia|contrada|corso|cortile|costa|discesa|fondo|galleria|frazione|isola|lido|litoranea|lungo|
												 lungomare|masseria|molo|mura|passaggio|passo|pendio|piazza|piazzale|piazzetta|ponte|portico|porto|rampa|recinto|rione|riva|rotonda|salita|scalinata|scesa|sentiero|
												 spiaggia|spiazzo|strada|stradale|stretto|stretta|strettoia|terrazza|traversa|via|vicoletto|vico|villaggio|viuzza)( )[ A-Za-z0-9]+(, )[ A-Z0-9]+(, )[0-9]{5}(, )[\x20-\xA5]+(, )[\x20-\xFF]+$' );


-- Controllo e-mail del cliente e del ristorante.
ALTER TABLE Customer
ADD CONSTRAINT customer_email_check CHECK (email ~* '^[A-Za-z0-9._%-]+(@)[A-Za-z0-9.-]+[.][A-Za-z]+$'::text);

ALTER TABLE Shop
ADD CONSTRAINT shop_email_check CHECK (email ~* '^[A-Za-z0-9._%-]+(@foodoverflow.it)$');

-- Controllo codice fiscale del cliente e del rider.
ALTER TABLE Customer
ADD CONSTRAINT customer_cf_check CHECK (cf ~* '^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$');

ALTER TABLE Rider
ADD CONSTRAINT rider_cf_check CHECK (cf ~* '^[a-zA-Z]{6}[0-9]{2}[abcdehlmprstABCDEHLMPRST]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$');

-- Controllo giorni di chiusura del ristorante.
ALTER TABLE Shop 
ADD CONSTRAINT shop_closing_days_check CHECK (closing_days ~* '^((lunedì|lunedi|martedì|martedi|mercoledì|mercoledi|giovedì|giovedi|venerdì|venerdi|sabato|domenica)(, (?!$)|$))*$');

-- Controllo orario di lavoro del ristorante e del rider.
ALTER TABLE Shop
ADD CONSTRAINT shop_working_hours_check CHECK (working_hours ~* '^([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})(-)([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})$');

ALTER TABLE Rider 
ADD CONSTRAINT rider_working_hours_check CHECK (working_hours ~* '^([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})(-)([0-2]{1}[0-9]{1})(:)([0-5]{1}[0-9]{1})$');

-- Controllo numero di cellulare del cliente e del rider.
ALTER TABLE Customer
ADD CONSTRAINT customer_cellphone_check CHECK (cellphone ~ '^[0-9]{10}$');

ALTER TABLE Rider
ADD CONSTRAINT rider_cellphone_check CHECK (cellphone ~ '^[0-9]{10}$');

-- Controllo numero di telefono del ristorante.
ALTER TABLE Shop
ADD CONSTRAINT shop_home_phone_check CHECK (home_phone ~ '^(004191|010|011|0121|0122|0123|0124|0125|0131|0141|0142|0143|0144|015|0161|0163|0165|0166|0171|0172|0173|0174|0175|0182|0183|0184|0185|0187|019|02|030|031|0321|0322|0323|0324|0331|0332|0341|0342|0343|
0344|0345|0346|035|0362|0363|0364|0365|0371|0372|0373|0374|0375|0376|0377|0381|0382|0383|0384|0385|0386|039|040|041|0421|0422|0423|0424|0425|0426|0427|0428|0429|0431|0432|0433|0434|0435|0436|0437|0438|
0439|0442|0444|0445|045|0461|0462|0463|0464|0465|0471|0472|0473|0474|0481|049|050|051|0521|0522|0523|0524|0525|0532|0533|0534|0535|0536|0541|0542|0543|0544|0545|0546|0547|0549|055 0564|0565|0566|0571|
0572|0573|0574|0575|0577|0578|0583|0584|0585|0586|0587|0588|059 06|0623|070 071|0721|0722|0731|0732|0733|0734|0735|0736|0737|0742|0743|0744|0746|075|0761|0763|0765|0766|0771|0773|0774|0775|0776|0781|
0782|0783|0784|0785|0789|079|080|081|0823|0824|0825|0827|0828|0831|0832|0833|0835|0836|085|0861|0862|0863|0864|0865|0871|0872|0873|0874|0875|0881|0882|0883|0884|0885|089|090|091|0921|0922|0923|
0924|0925|0931|0932|0933|0934|0935|0941|0942|095|0961|0962|0963|0964|0965|0966|0967|0968|0971|0972|0973|0974|0975|0976|0981|0982|0983|0984|0985|099)(-)[0-9]{7}$'); -- OK

-- Controllo numero di consegne in corso del rider.
ALTER TABLE Rider
ADD CONSTRAINT rider_delieveries_number_check CHECK deliveries_number >= 0;

-- Controllo prezzo dell'alimento.
ALTER TABLE Meal
ADD CONSTRAINT meal_price_check CHECK price > 0;

-- Controllo quantità della composizione dell'ordine.
ALTER TABLE OrderComposition
ADD CONSTRAINT order_composition_quantity_check CHECK quantity > 0;

-- Controllo stato di consegna dell'ordine.
ALTER TABLE CustomerOrder
ADD CONSTRAINT customer_order_status_check CHECK (status ~* '^(In attesa|In consegna|Consegnato|Errore)$');

-- Controllo categoria dell'alimento.
ALTER TABLE Meal
ADD CONSTRAINT meal_category_check CHECK (category ~* '^(Primo piatto|Carne|Pesce|Pizza|Panino|Fritto|Dolce|Bevanda analcolica|Bevanda alcolica)$');

-- Controllo nome dell'allergene.
ALTER TABLE Allergen
ADD CONSTRAINT allergen_name_check CHECK (name ~* '^(Cereali e derivati|Crostacei|Uova|Pesce|Arachidi|Soia|Latte e derivati|Frutta a guscio|Sedano|Senape|Sesamo|An. solforosa e solfiti|Lupini|Molluschi)$');

-- Controllo sesso del rider e del cliente.
ALTER TABLE Rider
ADD CONSTRAINT rider_gender_check CHECK (gender ~* '^(M|F)$');

ALTER TABLE Customer
ADD CONSTRAINT customer_gender_check CHECK (gender ~* '^(M|F)$');


