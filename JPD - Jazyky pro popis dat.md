# JPD - Jazyky pro popis dat
[[jpd-info.pdf]]

## Literatura
- Aaron Skonnard, Martin Gudgin: XML pohotová referenční příručka Grada, 2005
- https://www.w3schools.com/xml/xml_dtd_intro.asp
- [Stránky Jiřího Koska](http://www.kosek.cz/), zejména [XML seriál](http://www.kosek.cz/clanky/swn-xml/index.html), [XML schémata](http://www.kosek.cz/xml/schema/index.html) a [XSLT v příkladech](http://www.kosek.cz/xml/xslt/index.html)
- [Transforming XML](http://www.xml.com/pub/at/16) – seriál na serveru [xml.com](http://www.xml.com/)
- [Interval](http://interval.cz/), zejména [Slabikář XML](http://interval.cz/serialy/slabikar-xml/) a [Kompletní průvodce XSLT](http://interval.cz/serialy/kompletni-pruvodce-xslt/)
- [Programujeme s XML](http://www.linuxsoft.cz/article_list.php?id_kategory=182) – seriál na Linuxsoft.cz

## Zkouška
Soubory stáhnete z jeho webu (da link), můžete to dělat na vlastních pc. Až to budete mít hotové, Satrapa se podívá na výstup, na kód a řekne "dobře".

- [[zkouska_2023]]
- [[zkouska_2024]]
## Přednášky
Testy jsou z látky probrané na přednáškách.

1. [[prednaska01.pdf|přednáška]]
2. [[prednaska02.pdf|přednáška]]
3. [[prednaska03.pdf|přednáška]]
4. [[prednaska04.pdf|přednáška]]
5. [[prednaska05.pdf|přednáška]]
6. [[prednaska06.pdf|přednáška]]
7. [[prednaska07.pdf|přednáška]]
8. [[prednaska08.pdf|přednáška]]
9. [[prednaska09.pdf|přednáška]]
10. [[prednaska10.pdf|přednáška]]
11. [[prednaska11.pdf|přednáška]]
12. [[prednaska12.pdf|přednáška]]
## Cvičení
1. [[cviceni01|cvičení]]
2. [[TUL-navazující_studium/1. semestr/JPD-Jazyky_pro_popis_dat/cviceni/cv02/cv02|cvičení]]
3. [[cv03|cvičení]]
4. [[TUL-navazující_studium/1. semestr/JPD-Jazyky_pro_popis_dat/cviceni/cv04/cv04|cvičení]]
5. [[TUL-navazující_studium/1. semestr/JPD-Jazyky_pro_popis_dat/cviceni/cv05/cv05|cvičení]]
6. [[TUL-navazující_studium/1. semestr/JPD-Jazyky_pro_popis_dat/cviceni/cv06/cv06|cvičení]]
7. [[TUL-navazující_studium/1. semestr/JPD-Jazyky_pro_popis_dat/cviceni/cv07/cv07|cvičení]]
8. [[cv08|cvičení]]
9. [[cv09|cvičení]]
10. [[cv10|cvičení]]

## Výklad

Datové soubory:
- binární
- textové
	- pevná struktura
	- volná struktura

Textový jazyk pro popis dat, kterému se budeme věnovat:
- [[XML]]
	- [[DTD]]
	- [[Jmenné prostory]]
	- [[Schema]]
	- [[Relax NG]]
	- [[XPath]]

### Nástroje

#### xmllint
Jednoduchý program pro úpravu formátování XML dokumentů. Vhodný pro validaci. Použití:
``` bash
xmllint --noout soubor.xml
```  
zkontroluje, zda je *soubor.xml* správně strukturovaný.

``` bash
xmllint --noout --valid soubor.xml
```  
zkontroluje, zda je *soubor.xml* správný (validní). XML soubor musí obsahovat odkaz na DTD.

``` bash
xmllint --noout --schema jazyk.xsd soubor.xml
```  
zkontroluje, zda je *soubor.xml* správný (validní) podle XML schématu v souboru *jazyk.xsd*.

``` bash
xmllint --noout --relaxng jazyk.rng soubor.xml
```  
zkontroluje, zda je *soubor.xml* správný (validní) podle Relax NG schématu v souboru *jazyk.rng*.

#### xsltproc
Jednoduchý XSLT procesor, součást balíku libxslt. Použití:

``` bash
xsltproc styl.xsl soubor.xml
```  
transformuje *soubor.xml* podle pravidel daných v *styl.xsd*.