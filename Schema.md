# Schema
označováno XSD (XML Schema Definition)
jmenný prostor: xmlns:xsd=“http://www.w3.org/2001/XMLSchema“
Oproti DTD umožnuje pokročilou definici datových typů (jiných než string).

https://www.w3.org/TR/xmlschema-2/#built-in-datatypes

![[type-hierarchy.gif]]

## Restrikce řetězců
### enumeration

výčet hodnot: enumeration 
příklad: fakulty naší univerzity 

``` xml
<xsd:simpleType name="fakultaTULType">
	<xsd:restriction base="xsd:string"> 
		<xsd:enumeration value="FS"/> 
		<xsd:enumeration value="FT"/> 
		<xsd:enumeration value="FP"/> 
		<xsd:enumeration value="EF"/> 
		<xsd:enumeration value="FM"/> 
		<xsd:enumeration value="FA"/> 
	</xsd:restriction> 
</xsd:simpleType>
```

### patern
příklad: telefon – 3 skupiny 3 číslic, lze s mezerami 
``` xml
<xsd:simpleType name="telefonType"> 
	<xsd:restriction base="xsd:token"> 
		<xsd:pattern value="\d{3} ?\d{3} ?\d{3}"/> 
	</xsd:restriction> 
</xsd:simpleType>
```

## Složené datové typy
Popisují strukturu dokumentu. Definují vzájemné vztahy jednotlivých prvků. 
Tři základní druhy: 
- **sequence** – prvky se musí vyskytovat v daném pořadí 
- **all** – prvky se mohou vyskytovat v libovolném pořadí 
- **choice** – vyskytuje se jeden z uvedených prvků 
lze vnořovat (kromě all)

## Prvky
Prvek element, atributy: 
- name – jméno prvku, povinný 
- type – typ prvku (co je jeho obsahem); pokud chybí, může být typ obsahu definován přímo na místě jako obsah prvku element 
- default – implicitní obsah prvku 
- fixed – pevně definovaný obsah prvku

## Atributy
Prvek attribute, jeho atributy: 
- name – jméno atributu, povinný 
- type – typ atributu (omezuje hodnotu), povinný 
- use – hodnota “required“ stanoví povinný atribut 
- default – implicitní hodnota 
Musí být na konci (za prvky). Do složených typů se přidává normálně 

`<xsd:attribute name=“id“ type=“xsd:ID“ use=“required“/>`

## Jak vytvářet schéma?
- matrjoška 
- plátkování 
- slepý Benátčan

### Matrjoška
Definice prvků se do sebe ve schématu vkládají přímo, stejně jako prvky v dokumentu. Na nejvyšší úrovni vždy jen jeden prvek. Krátké a kompaktní schéma. Pro složitější jazyky nepřehledné. Nelze opakovaně využívat dílčí definice.

#### Příklad
``` xml
<xsd:element name=“zbozi“ maxOccurs=“unbounded“> 
	<xsd:complexType> 
		<xsd:sequence> 
			<xsd:element name=“nazev“ type=“xsd:string“/> 
			<xsd:element name=“cena“ type=“xsd:decimal“/> 
		</xsd:sequence> 
		<xsd:attribute name=“kod“ type=“xsd:integer“/> 
	</xsd:complexType> 
</xsd:element>
```

### Plátkování
Všechny prvky a atributy se definují na stejné (nejvyšší) úrovni. Odkazují se na sebe pomocí ref=“jméno“. Definované prvky/atributy lze používat opakovaně. Koncepce blízká DTD. Obsah prvku se nemůže lišit podle kontextu (rodiče).

#### Příklad
``` xml
<xsd:element name=“nazev“ type=“xsd:string“/> 
<xsd:element name=“cena“ type=“xsd:decimal“/> 
<xsd:attribute name=“kod“ type=“xsd:integer“/> 

<xsd:element name=“zbozi“> 
	<xsd:complexType> 
		<xsd:sequence> 
			<xsd:element ref=“nazev“/> 
			<xsd:element ref=“cena“/> 
		</xsd:sequence> 
		<xsd:attribute ref=“kod“/> 
	</xsd:complexType> 
</xsd:element>
``` 

### Slepý Benátčan
Předem se (na globální úrovni) definují typy. Prvky a atributy se definují lokálně (jako v matrjošce), ovšem triviálně s využitím připravených typů. Nejflexibilnější, typy lze používat opakovaně, ale schéma je delší. Vhodné pro složité jazyky.

#### Příklad
``` xml
<xsd:simpleType name=“nazevTyp“> 
	<xsd:restriction base=“xsd:string“> 
		<xsd:maxLength value=“50“/> 
	</xsd:restriction> 
</xsd:simpleType> 

<xsd:simpleType name=“cenaTyp“> 
	<xsd:restriction base=“xsd:decimal“> 
		<xsd:fractionDigits value=“2“/> 
	</xsd:restriction> 
</xsd:simpleType>

<xsd:simpleType name=“kodTyp“> 
	<xsd:restriction base=“xsd:integer“/> 
</xsd:simpleType>

<xsd:complexType name=“zboziTyp“> 
	<xsd:sequence> 
		<xsd:element name=“nazev“ type=“nazevTyp“/> 
		<xsd:element name=“cena“ type=“cenaTyp“/> 
	</xsd:sequence> 
	<xsd:attribute name=“kod“ type=“kodTyp“/> 
</xsd:complexType>

<xsd:element name=“zbozi“ type=“zboziTyp“/>
```