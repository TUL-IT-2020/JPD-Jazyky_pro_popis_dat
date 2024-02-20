# Zkouška

## Zadání

Datovy soubor `auta.xml` obsahuje informace o automobilech a jejich prodejcich. Vytvorte html tabulku s informacemi o prodejcich (prvky firma v prvku prodejci), kde kazdemu prodejci bude odpovidat jeden radek (`tr`). Prvni sloupec (`td`) bude obsahovat vzdy **nazev prodejce**, druhy jeho **adresu** - nejprve mesto a za nim carkou oddelenou ulici. 

Vystup by tedy mel vypada zhruba nasledovane:
``` HTML
<table>
    <tr>
        <td> Autosalon Vlk</td>
        <td> Plzen, U pivovaru 19 </td>
    </tr>
</table>
```

### Rozšiřující zadání
Do tabulky zaradte pouze prazske prodejce. Seradte je abecedne podle nazvu. Pridejte do tabulky treti sloupec obsahujici modely vozu nabizenych danym prodejcem. Mel by obsahovat nazvy vsech prvku model, jejichz atribut vyrobce se shoduje s obsahem nektereho prvku znacka obsazeneho v danem prodejci. 

Tabulka by tedy mela zacina takto:
``` HTML
<tr>
    <td> Autosalon Mysak</td>
    <td> Praha, Siroka 37 </td>
    <td> Enyaq superb octavia fabia </td>
</tr>
```

## Řešení
Linux (xsltproc)
``` Bash
xsltproc -o vystup.html transformace.xsl data.xml
```