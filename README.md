---
editor: 
  markdown: 
    wrap: 72
---

# Time Series Econometrics (TSE): kurssimateriaali

Tämä repo sisältää kurssimateriaalin **lähdetiedostot**. Quarto tuottaa
niistä kaksi versiota:

-   **Verkkosivu** <https://utueconometrics.github.io/TSE26/> (linkki
    kurssin moodlesivulle). R Lab -koodit ja Extra-osiot aukeavat
    klikkaamalla.
-   **PDF** `msTSE2026.pdf` (ladataan Moodleen käsin, myös
    tenttimateriaaliksi). Ei R-koodia, Extra-osiot laatikoissa.

Molemmat syntyvät samoista `.qmd`-tiedostoista, joten tekstiä muokataan
vain yhdessä paikassa.

> **Ensimmäinen kerta?** Aloita kohdasta
> [Käyttöönotto](#käyttöönotto-kerran).

------------------------------------------------------------------------

## Pikaohje

Avaa projekti tiedostosta `msTSE.Rproj` ja käytä RStudion
**Git**-välilehteä:

1.  **Pull**: hae muiden muutokset.
2.  Muokkaa ja esikatsele (Render tai `quarto preview`).
3.  **Commit**: tallenna muutos versioksi lyhyen kuvauksen kera.
4.  **Push**: lähetä GitHubiin.
5.  Kun muutosten pitää näkyä opiskelijoille, aja Terminalissa
    `quarto publish gh-pages` ja vie tarvittaessa uusi PDF Moodleen.

Tarkemmat ohjeet alla.

------------------------------------------------------------------------

## Muokkaaminen

### 1. Hae uusin versio (Pull)

Git-välilehden sininen nuoli alas. Tee tämä **aina ennen kuin aloitat**.
Muuten muokkaat vanhaa versiota, ja myöhemmin Push hylätään.

### 2. Muokkaa ja esikatsele

Luvut ovat tiedostoissa `TSE-ch1.qmd` … `TSE-ch13.qmd` ja esipuhe
tiedostossa `index.qmd`. Esikatseluun on kaksi tapaa:

-   **Yksi luku**: editorin *Render*-nappi renderöi avoimen luvun
    HTML-esikatseluun.
-   **Koko kirja, päivittyy tallennettaessa**: aja Terminalissa
    `quarto preview`. Selain avautuu ja päivittyy aina, kun tallennat
    tiedoston. Lopeta painamalla Ctrl+C.

PDF:n tarkistamiseen: `quarto render --to pdf`. Tulos tulee tiedostoon
`_book/msTSE2026.pdf`.

### 3. Tallenna versio (Commit)

Git-välilehti listaa muuttuneet tiedostot. Kirjainten merkitys: **M** =
muokattu, **?** = uusi tiedosto, **D** = poistettu.

1.  Paina *Commit*. Avautuvassa ikkunassa näkyvät muutokset rivi
    riviltä: poistetut punaisella, lisätyt vihreällä. Tarkista, että
    mukana on vain se, mitä tarkoitit.
2.  Rastita *Staged*-sarakkeesta tiedostot, jotka kuuluvat tähän
    muutokseen.
3.  Kirjoita lyhyt kuvaus, esim.
    `Luku 4: korjattu AR(1)-esimerkin merkinnät`.
4.  Paina *Commit*.

Yksi commit = yksi asiakokonaisuus. Pienet, hyvin nimetyt commitit
helpottavat myöhemmin, jos jokin muutos pitää löytää tai perua.

### 4. Lähetä GitHubiin (Push)

Vihreä nuoli ylös. Vasta tämän jälkeen muutokset ovat tallessa
GitHubissa ja muiden saatavilla. Commit ilman Pushia on vain omalla
koneella.

### Muutoksen peruminen

-   **Tallentamaton tai commitoimaton muutos**: Git-välilehti → valitse
    tiedosto → ratas-valikko → *Revert*. Tiedosto palaa viimeisimmän
    commitin tilaan.
-   **Vanha versio tiedostosta**: Git-välilehti → *History*
    (kellokuvake) näyttää jokaisen commitin ja sen muutokset. Vanhan
    tekstin voi kopioida sieltä takaisin. Sama historia näkyy myös
    GitHubissa.

------------------------------------------------------------------------

## Julkaisu

### Verkkosivu

1.  Varmista, että muutokset on commitoitu ja pushattu. Sivuston pitää
    vastata GitHubissa olevaa versiota.

2.  Aja RStudion Terminalissa:

    ``` bash
    quarto publish gh-pages
    ```

    Komento renderöi koko materiaalin (HTML ja PDF), vie sen
    `gh-pages`-haaraan ja odottaa, että GitHub Pages päivittää sivuston.
    Koko prosessi kestää muutaman minuutin.

3.  Tarkista sivu: <https://utueconometrics.github.io/TSE26/>. Jos
    muutos ei näy, lataa sivu uudelleen ohittaen välimuistin (Ctrl+F5 /
    Cmd+Shift+R).

`gh-pages`-haara sisältää vain renderöidyn sivuston. Sitä ei muokata
käsin.

### PDF

Julkaisun (tai komennon `quarto render --to pdf`) jälkeen PDF on
tiedostossa `_book/msTSE2026.pdf`. Lataa se Moodleen käsin. Sama PDF on
ladattavissa myös sivuston sivupalkin kuvakkeesta. Jos kuvaketta ei
haluta, poista rivi `downloads: [pdf]` tiedostosta `_quarto.yml`.

**Uusi kurssivuosi**: vaihda tiedoston `_quarto.yml` kohta
`output-file: "msTSE2026"`.

------------------------------------------------------------------------

## Materiaalin kirjoittaminen

### Projektin rakenne

| Mitä                                  | Missä                                       |
|---------------------------------------|---------------------------------------------|
| Esipuhe ja luvut                      | `index.qmd`, `TSE-ch1.qmd` … `TSE-ch13.qmd` |
| Lukujen järjestys, otsikko, asetukset | `_quarto.yml`                               |
| Tekstin kuvat                         | `images/`                                   |
| R Lab -koodien datat                  | projektin juuressa (ks. [Datat](#datat))    |
| Verkkodatojen kertalataus             | `data-raw/download_data.R`                  |
| Ulkoasu (CSS) ja LaTeX/MathJax-makrot | `assets/`                                   |
| Renderöity tulos (ei repossa)         | `_book/`                                    |

### Extra-osio

Taitettu laatikko: HTML:ssä aukeaa klikkaamalla, PDF:ssä näkyy
laatikkona.

``` markdown
::: {.callout-note collapse="true"}
## Extra: Otsikko tähän

Teksti, kaavat ja kuvat kuten muuallakin.
:::
```

### R-koodi (R Lab)

R Lab on jokaisen luvun lopussa lohkon sisällä, joka näkyy **vain
HTML-versiossa**:

```` markdown
:::: {.content-visible when-format="html"}

## R Lab

::: {.callout-tip collapse="true"}
## R Lab: Otsikko tähän

```{r}
# koodi
```
:::

::::
````

Uusi R-koodilaatikko lisätään olemassa olevan `::::`-lohkon sisään.
Kaikki `::::`-rivien välissä oleva jää PDF:stä pois.

Huomioita koodista: - Koodin datat luetaan pelkällä tiedostonimellä,
esim. `read_excel("GDPC1-qdata.xlsx")`. Opiskelijat lataavat datat
samaan kansioon kuin koodin. - Älä käytä koodissa tai tulosteissa
emojeja tai muita erikoismerkkejä. Ne kaatavat PDF:n kääntämisen, jos
koodi joskus päätyy PDF:ään.

### Kuva

Tallenna PNG kansioon `images/` (tiedostonimessä ei välilyöntejä) ja
lisää tekstiin:

```` markdown
```{r, echo=FALSE, out.width="75%", fig.align="center"}
knitr::include_graphics("images/tiedosto.png")
```
````

Jos leveyden pitää olla eri HTML:ssä ja PDF:ssä:
`out.width=if (knitr::is_html_output()) "100%" else "55%"`.

### Teksti ja kuva vierekkäin

Käytä `.columns`-rakennetta. **Älä käytä `layout-ncol`-asetusta**, koska
se kaataa PDF:n uudemmilla LaTeX-versioilla. HTML:ssä palstat ovat
vierekkäin, PDF:ssä peräkkäin.

```` markdown
:::: {.columns}
::: {.column width="50%"}
Teksti tai lista.
:::

::: {.column width="50%"}
```{r, echo=FALSE, fig.align="center"}
knitr::include_graphics("images/tiedosto.png")
```
:::
::::
````

### Sisältö vain toiseen versioon

``` markdown
::: {.content-visible when-format="pdf"}
Näkyy vain PDF:ssä.
:::

::: {.content-visible when-format="html"}
Näkyy vain verkkosivulla.
:::
```

### Omat LaTeX-makrot

Makrot, kuten `\ubar`, määritellään **kahdessa** paikassa:
`assets/preamble-TSE.tex` (PDF) ja `assets/html-header.html`
(verkkosivu, MathJax). Uusi makro pitää lisätä molempiin.

### Uusi luku

Luo tiedosto (esim. `TSE-ch14.qmd`), joka alkaa otsikolla
`# Luvun nimi`, ja lisää se tiedoston `_quarto.yml` kohtaan `chapters:`
oikeaan kohtaan listaa.

### Merkintöjen yleissääntö

Kaksoispisteet (`:::`) ovat omilla riveillään, ja jokaiselle avaavalle
riville tarvitaan sulkeva rivi. Sisäkkäisissä lohkoissa uloin lohko
merkitään useammalla kaksoispisteellä (`::::`).

------------------------------------------------------------------------

## Datat {#datat}

| Tiedosto                         | Luku       | Lähde                                  |
|------------------------|------------------------|------------------------|
| `Shiller_data_031025.txt`        | 1, 12      | Shillerin data                         |
| `GDPC1-qdata.xlsx`               | 3, 4, 7, 8 | FRED                                   |
| `us_macrodata.txt`               | 11         | FRED (Stock & Watson -tyyppinen data)  |
| `NDX_daily.csv`, `IRX_daily.csv` | 9          | Yahoo Finance, 2003-01-01 … 2025-09-30 |
| `PIH_FRED_quarterly.csv`         | 13         | FRED, 1959Q1 … 2025Q2                  |

Kaikki datat on tallennettu repoon, joten renderöinti ei tarvitse
verkkoyhteyttä ja tulokset pysyvät samoina. Opiskelijat tarvitsevat
samat tiedostot R Labeja varten.

**Lukujen 9 ja 13 datojen päivitys**: muuta tarvittaessa otosjakso
tiedostossa `data-raw/download_data.R` ja aja
`source("data-raw/download_data.R")`. Skripti lataa datat uudelleen ja
korvaa CSV-tiedostot. Tämän jälkeen tekstissä olevat tulokset ja kuvat
on päivitettävä vastaamaan uutta dataa. FRED myös revisioi
historiallisia lukuja, joten sama otos voi antaa hieman eri tuloksen
kuin aiemmin.

------------------------------------------------------------------------

## Git lyhyesti

Muutoksella on kolme vaihetta:

1.  **Työkansio** on projektikansio koneellasi. Siellä muokataan
    tiedostoja tavalliseen tapaan.
2.  **Commit** tallentaa muutokset versioksi koneen omaan historiaan.
3.  **Push** lähettää commitit GitHubiin. **Pull** hakee sieltä muiden
    commitit.

Muita käsitteitä:

-   **Haara (branch)**: työ tehdään `main`-haarassa. `gh-pages`-haaran
    julkaisukomento hoitaa itse.
-   **`.gitignore`** määrää, mitä Git ei seuraa. Renderöity
    `_book/`-kansio ja LaTeX-välitiedostot (`index.tex`, `index.log`)
    eivät siksi näy muutoksina.
-   **Konflikti** syntyy, jos kaksi ihmistä muuttaa samaa kohtaa samasta
    tiedostosta eri koneilla. Sen välttää, kun tekee Pullin ennen työn
    aloittamista ja sopii, kuka työstää mitäkin lukua.

------------------------------------------------------------------------

## Kun jokin menee pieleen

| Tilanne                                          | Syy ja korjaus                                                                                                                                                                                                                          |
|------------------------------------|------------------------------------|
| Git-välilehti puuttuu                            | Projekti ei ole auki. Avaa `msTSE.Rproj`. Jos välilehti puuttuu silti, tarkista *Tools → Global Options → Git/SVN*, että Git löytyy.                                                                                                    |
| Push hylätään: *Updates were rejected…*          | GitHubissa on muutoksia, joita sinulla ei ole. Tee Pull ja sitten uudelleen Push.                                                                                                                                                       |
| *Authentication failed* Pushissa tai julkaisussa | GitHub-token on vanhentunut. Tee uusi (ks. [Käyttöönotto](#käyttöönotto-kerran), kohta 4).                                                                                                                                              |
| Pull ilmoittaa konfliktista                      | Tiedostossa on kohta, jossa on merkit `<<<<<<<`, `=======` ja `>>>>>>>`. Niiden välissä ovat molemmat versiot. Jätä oikea teksti, poista merkkirivit, tallenna, tee commit ja push.                                                     |
| R Lab: *cannot open file 'X.csv'*                | Työhakemisto on väärä. Avaa projekti `msTSE.Rproj`:sta tai valitse *Session → Set Working Directory → To Project Directory*.                                                                                                            |
| PDF ei käänny (LaTeX-virhe)                      | Avaa `index.log` ja hae ensimmäinen `!`-alkuinen rivi. Rivinumero (`l.550`) kertoo kohdan tiedostossa `index.tex`, ja sen ympäristöstä näkee, mistä luvusta on kyse. Tavallisia syitä ovat erikoismerkit sekä `layout-ncol` (ks. yllä). |
| `quarto publish` jää odottamaan                  | Lähetys onnistui, mutta GitHub Pages ei ole päällä. Pages-asetukset vaativat organisaation ylläpitäjän oikeudet.                                                                                                                        |
| Muutos ei näy sivustolla                         | Varmista, että `quarto publish gh-pages` on ajettu. Odota pari minuuttia ja ohita selaimen välimuisti (Ctrl+F5).                                                                                                                        |

------------------------------------------------------------------------

## Käyttöönotto (kerran) {#käyttöönotto-kerran}

1.  **Ohjelmat**: R ja RStudio. Quarto tulee RStudion mukana.

    -   **Git**: Windowsille <https://git-scm.com>. Macilla aja
        Terminalissa `xcode-select --install`. Käynnistä RStudio
        asennuksen jälkeen uudelleen.
    -   **LaTeX PDF:ää varten**: aja RStudion Terminalissa
        `quarto install tinytex`.

2.  **R-paketit**:

    ``` r
    install.packages(c("knitr", "rmarkdown", "readxl", "writexl", "dplyr", "lubridate",
                       "ggplot2", "zoo", "forecast", "tseries", "urca", "quantmod",
                       "rugarch", "TSA", "astsa", "vars", "usethis", "gitcreds"))
    ```

```{=html}
<!-- -->
```
3.  **Nimi ja sähköposti** commiteihin. Git liittää ne jokaiseen
    committiin eikä suostu tekemään committia ilman niitä. Jos olet jo
    käyttänyt Gitiä tällä koneella tai asettanut ne GitHub Desktopissa
    (*Options → Git*), tämän voi ohittaa. Muuten aja kerran Consolessa:

``` r
   usethis::use_git_config(user.name = "Etunimi Sukunimi", user.email = "nimi@utu.fi")
```

Käytä samaa sähköpostia kuin GitHub-tililläsi, niin commitit yhdistyvät
tiliisi.

4.  **Repon haku koneelle**: *File → New Project → Version Control →
    Git*. Repository URL on
    [`https://github.com/UTUeconometrics/TSE26.git`](https://github.com/UTUeconometrics/TSE26.git).
    Valitse kansio, joka ei ole OneDrive-, Dropbox- tai
    iCloud-synkronoinnissa. RStudio avaa projektin, ja oikeaan
    yläkulmaan tulee Git-välilehti.

5.  **Kirjautuminen GitHubiin** tapahtuu ensimmäisen Pushin yhteydessä.
    Git avaa selaimeen GitHubin kirjautumisikkunan. Kirjaudu ja hyväksy,
    niin kirjautuminen tallentuu koneelle eikä sitä kysytä uudelleen.
    Sama kirjautuminen toimii sekä Git-välilehdellä että
    `quarto publish` -komennossa.

    Windowsilla selainkirjautumisen hoitaa Git for Windowsin mukana
    tuleva Git Credential Manager. Jos selainikkuna ei aukea vaan Git
    kysyy salasanaa (esim. Macilla, jossa Git Credential Manager ei ole
    oletuksena), kirjaudu tokenilla Consolessa:

    ``` r
    usethis::create_github_token()   # avaa GitHubin token-sivun; luo token ja kopioi se
    gitcreds::gitcreds_set()         # liitä token pyydettäessä
    ```

6.  **Testi**: aja Terminalissa `quarto render`. Jos `_book/`-kansioon
    syntyy HTML ja PDF, kaikki on kunnossa.

Kirjoitusoikeuden repoon antaa UTUeconometrics-organisaation ylläpitäjä.

------------------------------------------------------------------------

## Avoimet asiat

-   Luvun 13 kuvateksti puhuu kuukausidatasta 1959:1–2025:8, mutta data
    ja tekstin regressiotulokset ovat neljännesvuosidataa 1959Q1–2025Q2
    (266 havaintoa).
-   Luvussa 12 sama ranskalainen viiva toistuu kahdesti peräkkäin.
    Lisäksi tekstin sisällä oleva ADF-koodiesimerkki näkyy PDF:ssä.
-   Kuvatekstit ovat käsin kirjoitettuja (`<span class="fig-caption">`),
    joten kuviin ei voi viitata numerolla.
-   Sivusto on julkinen kaikille, joilla on linkki.
-   `assets/html-header.html` estää oikean hiiren painikkeen valikon
    verkkosivulla (alkuperäinen ratkaisu). Poista kyseinen `<script>`,
    jos sitä ei haluta.
