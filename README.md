---
editor: 
  markdown: 
    wrap: 72
---

# Time Series Econometrics (TSE): kurssimateriaali

Tämä repo sisältää kurssin materiaalin **lähdetiedostot**. Niistä Quarto
tuottaa kaksi versiota:

-   **HTML-kirja** (selattava verkkoversio, jossa R-koodit ja
    Extra-osiot aukeavat klikkaamalla)
-   **PDF** (`msTSE2026.pdf`, esim. tenttimateriaaliksi): ei R-koodia,
    Extra-osiot laatikoissa

Molemmat syntyvät samoista tiedostoista. Tekstiä muokataan siis vain
yhdessä paikassa.

## Kansiorakenne

| Mitä                                  | Missä                                                             |
|------------------------------------|------------------------------------|
| Esipuhe ja luvut                      | `index.qmd`, `TSE-ch1.qmd` … `TSE-ch13.qmd`                       |
| Lukujen järjestys, otsikko, asetukset | `_quarto.yml`                                                     |
| Tekstin kuvat                         | `images/`                                                         |
| Datat (R Lab -koodit lukevat nämä)    | `GDPC1-qdata.xlsx`, `Shiller_data_031025.txt`, `us_macrodata.txt` |
| Ulkoasu ja LaTeX-makrot               | `assets/`                                                         |
| RStudio-projekti                      | `msTSE.Rproj`                                                     |

Renderöidyt tiedostot menevät kansioon `_book/`. Sitä **ei** tallenneta
repoon, koska sen voi aina tuottaa uudelleen.

## Asennukset (kerran)

1.  **R** ja **RStudio** (Quarto tulee RStudion mukana).

2.  **Git**: Windowsille <https://git-scm.com>, Macilla riittää ajaa
    kerran Terminalissa `xcode-select --install`.

3.  **LaTeX PDF:ää varten**: RStudion *Terminal*-välilehdellä
    `quarto install tinytex`.

4.  **R-paketit**: Consoleen

    ``` r
    install.packages(c("knitr", "rmarkdown", "readxl", "writexl", "dplyr", "lubridate",
                       "ggplot2", "zoo", "forecast", "tseries", "urca", "quantmod",
                       "rugarch", "TSA", "astsa", "vars", "usethis", "gitcreds"))
    ```

5.  **GitHub-tunnus** ja kirjoitusoikeus tähän repoon (pyydä repon
    omistajalta).

### Repon haku omalle koneelle

RStudiossa: *File → New Project → Version Control → Git*. Liitä repon
osoite (GitHubin vihreä *Code*-nappi) ja valitse kansio. RStudio avaa
projektin, ja oikeaan yläkulmaan ilmestyy **Git**-välilehti.

Ensimmäisellä kerralla Git kysyy nimeä ja sähköpostia. Ne voi asettaa
Consolessa:

``` r
usethis::use_git_config(user.name = "Etunimi Sukunimi", user.email = "nimi@utu.fi")
```

GitHubiin kirjautuminen: `usethis::create_github_token()` ja sen jälkeen
`gitcreds::gitcreds_set()`. (Vaihtoehto: GitHub Desktop -sovellus hoitaa
kirjautumisen ja samat toiminnot napeilla.)

## Muokkaaminen: perussykli

Avaa projekti aina tiedostosta `msTSE.Rproj`. Sitten:

1.  **Pull** (Git-välilehden sininen nuoli alas): hakee muiden tekemät
    muutokset. Tee tämä aina ensin.
2.  **Muokkaa** lukua, esim. `TSE-ch4.qmd`.
3.  **Esikatsele**: *Render*-nappi editorin yläpalkissa renderöi avoimen
    luvun.
4.  **Commit**: Git-välilehdellä rasti muutettujen tiedostojen kohdalle
    → *Commit* → kirjoita lyhyt kuvaus (esim. "Luku 4: korjattu
    AR(1)-esimerkin merkinnät") → *Commit*.
5.  **Push** (vihreä nuoli ylös): lähettää muutokset GitHubiin.

Git säilyttää jokaisen commitin, joten mitään ei voi vahingossa
hävittää. Vanhan version saa takaisin GitHubin *History*-näkymästä.

**Kaksi ihmistä samassa luvussa yhtä aikaa** on ainoa tilanne, josta
syntyy selvittelyä (konflikti). Sopikaa siis, kuka työstää mitäkin
lukua, ja tehkää aina Pull ennen muokkausta.

## Koko materiaalin renderöinti

RStudion *Terminal*-välilehdellä:

``` bash
quarto render              # HTML-kirja ja PDF
quarto render --to pdf     # vain PDF
quarto render --to html    # vain HTML
```

Tulokset ovat kansiossa `_book/`. PDF:n päiväys päivittyy
automaattisesti.

## Näin lisäät…

**Extra-osion** (HTML:ssä taitettu, PDF:ssä laatikko):

``` markdown
::: {.callout-note collapse="true"}
## Extra: Otsikko tähän

Teksti, kaavat $y_t$ ja kuvat kuten muuallakin.
:::
```

**R-koodin** lisää luvun lopun R Lab -osioon. Kaikki
`:::: {.content-visible when-format="html"}` … `::::` -rivien välissä
oleva näkyy vain HTML-versiossa. R-koodilaatikko:

```` markdown
::: {.callout-tip collapse="true"}
## R Lab: Otsikko tähän

```{r}
# koodi
```
:::
````

**Kuvan**: tallenna PNG kansioon `images/` ja lisää tekstiin

```` markdown
```{r, echo=FALSE, out.width="75%", fig.align="center"}
knitr::include_graphics("images/tiedosto.png")
```
````

Huom: kaksoispisteiden (`:::`) pitää olla omilla riveillään, ja
jokaiselle avaavalle riville tarvitaan sulkeva rivi.

## Tiedossa olevat asiat

-   Luvut 9 ja 13 hakevat R Lab -osioissa dataa verkosta (Yahoo Finance,
    FRED) renderöinnin aikana. Renderöinti vaatii siis verkkoyhteyden,
    ja tulokset voivat muuttua datan päivittyessä. Korjataan seuraavassa
    vaiheessa tallentamalla datat tiedostoiksi.
-   Kuvatekstit ovat vielä käsin kirjoitettuja
    (`<span class="fig-caption">`), joten kuviin ei voi viitata
    numerolla. Korjataan myöhemmin.
-   `assets/html-header.html` estää oikean hiiren painikkeen valikon
    HTML-versiossa (alkuperäinen ratkaisu). Poista kyseinen `<script>`,
    jos sitä ei haluta.
