
# Zkouška

[[zadani.jpg]]
## Zadání
Datový soubor obchody.xml obsahuje informace o prodejnách a jejich zboží. Převeďte jej do podoby HTML seznamu (prvek `ul`), kde pro každou prodejnu bude jedna položka (`li`) obsahující tučně (`strong`) její název, odřádkování (`br`) a adresu. 

Seznam by měl začínat:
``` HTML
<ul>
    <li><strong>Potraviny Jana</strong><br/>
    U jezu 154, Liberec</li>
    ...
</ul>
```

### Rozšiřující zadání
Zařaďte do seznamu jen prodejny v Jablonci nad Nisou. Ke každé prodejně přidejte seznam názvů zboží (vnořený prvek `li`), které prodává. Do seznamu zařaďte názvy těch prvků produkt, jejichž kategorie je obsažena některém prvku prodava dané prodejny. 

Začátek seznamu podle rozšiřujícího zadání:
``` HTML
<ul>
<li><strong>Domácí drogerie</strong><br/>
```

## Řešení
![[kod.jpg]]

Linux (xsltproc)
``` Bash
xsltproc -o vystup.html transformace.xsl data.xml
```

Windows (Saxon)
``` Batch
".\bin\transform.exe" -o:vystup.html -xsl:transformace.xsl grafika.xml
```