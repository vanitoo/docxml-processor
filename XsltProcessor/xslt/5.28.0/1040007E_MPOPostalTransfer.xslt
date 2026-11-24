<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mpost="urn:customs.ru:CustomsCardDoc:MPOPostalTransfer:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа MPOPostalTransferType -->
	<xsl:template match="mpost:MPOPostalTransfer">
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  position:relative;
                  font-family: Times New Roman;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 10mm;
                  background: #ffffff;
                  border: solid 1pt #ffffff;
                  position: relative;
                  }
				table{
					border-spacing: 0px;
				}
                </style>
			</head>
			<body>
				<div class="page" style="width: 190mm;height:277mm;">
					<img style="position:absolute; left:14mm; top:4mm; width:30mm; height:45mm;" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAIAAAADJCAIAAABkC604AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAB2nSURBVHhe7Z35V1VZdsfzB2Xlp2StdDrzSqc7P6Q76XRWkupOd1d3VfVcnaQrXVmlVjmU4oCooCCKI4qKiuIsyjwpo8w4lAgCTjjgAKhg5fPe93rqeB/v+Xi8xwM937XXXfvss8+59+7vPvucC1j1B186JBWvJ+DFixfjz58/ffp0dGTk/r17vT1ftDY3VJUVtzbVoz+4f290dITe8fHxiYkJb4xD1AhLAEF//PjRvbtDg/3Xr1zqbmmsr6koLT1zsqTohE9qKkuh5IvLFwcH+u/fHXry+DFkQNujhw8fDj9gHvSxsTGmevRwGJJQRp48wQhGRp7QfPbsKTqKLfDNYwTsQ3cs+x3sQWeMnj1wl+AdR0dH79y+ZWTozm1mJj/uDt227Y8fPXr29OndIW8qgAX78+fPno6NYeepMCoOgGcmz4bMtLdvMed9kvHu0IuJCTyZTdN6A6aCsARc6/mi4Vx1dUWJCTpKBAk6nIKMhvM1t24OEpHujrbW5sYnTx4/e/aso/VC/bnqO7dujo8/r6ko6e25yluB9tYmbnH/3l10FASaA1JZ2t93jccI2MuLPWNFKQ7Yg0bPmev5mkrWIne8OThQWXq2qrwYY1XZWa7DD+5jrK0sZRKaASkv7vniMnc8V1VObgXj/+Lq5YuVZWeJIFSdqy4fuN6LUXEAsNjSVB+Y0Ltpyc0bA82N5+tqK58H0+vKpS7ue/XKJW/AVBCWAB6irrZKkTViR9yI7VB29hQEkCM8VvuFpsa62ocPH1xoqq8sPdN3rYfHhQDceFaCePvmDQ0nlWiidHe2sW4ePwoIZY3HkP1SV4eMxAg7xuLTx5mcJfXg3j3iW1dTic4zM+H13h5SuO1CY3nxaTKXKFeUFA1e7yXfJSQEBBBQuAyE/8WLyxe7GMj8LBqqKzNgVBwACc69WpoacNAMvEggO8tLmAqOmZ+HZBJvwFQQloCbNwaR4fv3B673kcv1tZU8MXHkrRQ1rugVJWfIOLL7Ylf7jYF+/Hlh1isv0HahCQovNNbhrIhjnJgYV5M4MiFCUysA5VJ3R+ANR0fGxkahKhCbFy+wUwMxBjabsTHNAwHwymyBpdbZXltVxiTXe6/xSHdu38Shs+1CeXHRVwT092kGhF6cSfmeK5dEamd7C3dBvxskoOeLS7iNjY6qNvKoENDe0kyNUnAwigCKXld7K+uVzIszAf3Xe4kdEURYgBe7OogCV561vbW59UIjD4ROyLDDUNC5EiZwpiDyiBDAWwXZOqk1wbQigCGXujuJC6WDpiGAhUwFoDicr6m4fLFTwcJeUXqGlyTTG+trccYIAbVV5RQT9h5C1txYNzIywkIh6AQUh4625q8IKD1DuL0iVl7y9GlgQ8JCPgWnLVMKvyTgLF08Bl2N9efYEmBdBJDvCg7zQwCZR87BPe8L8XEmoP587dnTJxvqagnWtatXSCiCS/njyRrrashtSg260r+zvbXv2lViin7m5DECQUApQbwYOtnBC7Cl89wioKn+HLEg+ix5m4CO1mZCgPAyjKJXBHB3bYAEjnyUkcXXeL6Gmbs6Wgk0M6CXlxSxdHj+VwgoKSLZCaWEZ+COBJrajQPCFsWEZgWQVTgwkFTgfBGOAILe3HA+uDKex5+A6oqyjNUrli2ct2LJZ+vXrDy4L4+gURzhnBcm+mT9TZ6xt4clsn9Pbnrq8uWLF6QsWrBhbWpHWwvhYAXABychqj+vBxPPnz0TAQhdVA/CgW4IIJ15N+4uOzWQJmuIDJBdQA+UoMY63hwwD8O5EaRSqeXpI+DOrRsaKwQJKGbPUPPKyz0AAogrL4WRoxpxrz9XFY4AnpA9eejOLe4efwIuXey6fLG7q6O9ovTs/j27stevTV+9PDVl8brU5bu25xwvLOC6dtWyVcsWp6et2JyZDkNV5SWUY1YDtAQJaIQnJT55xHonoCKAx7196wZ2BdpswnDZ2dZCPSO9qAOET7E+V13BDBKOZwRCe4BizZWdA9Y5hpGzcIAbD8OEl7ra2cNYFuerK0gHyZXL3RBAudNBi+GUO5zZ/1lz3JcCSCGlovKc5ARn6AABra8QADFwRi6yMdCMPwGNded2bcshsluzN+zbvfPE0cMnjh46dvjg0cMHCgvyD+zdVXgwn+axwgK64GPvrh2bszLwz9u5jVpEoHk9MpftlOd79OghRmoO9q6Ott5rV1VJsPMOpB4EoLCqAtLZxnLhjER24xOwdwaMAeloI215Z7Y+c1bhSt2HbCoS1cOTrg7KI6uEWAe3nIDxcncnj8EMHI6JLF2MBbdv3cTOjsqTYA86d+LMK/Cc3K4vsPSv802j4DCEksu0LDvNwBqiQqp3SohEANW87lx1W0tzRVlxfl7u+jWr1qxYmrlu9aYN67Ztyty0IR199fLPscMHJYvcP1ddefrE0UvdXZQF1QcejtmIb7BFCZogjyz7uOpSwCFg90RHIG+gZQ90PX/umwQ8eQwB1RT6wKnIw3MszQ2BMuUZLDCDrswAgoepQFN2A+Pga74cEfj6E9Srh5kSwhJQUnSKDWDx/I+XfvYJeX3m1PGuzvb+vt7zNdX7du2g+JDy7ArBLaH91PEjWelpi+f/H7Ly84WqztQEqsGVi908Gccnsp5y1HP1CisdnWLV0txIot26eUPncdyGHzwYHLhONDnSXOzsuHXjBkbKFKubQ+G9u3eZB5++3mvMf+vGIF2UNcggHUlG+wsWhY8EfXsb4yxEWAKIFLWCsxDB3bNzW05WhlbAxow1B/ftLjl7mmtW+po0VsDaVTkb18NH0YljnNvaWy/cGBwgI3Iy08+ePl6Qv6emspwilp+3s+F87ZaN69laTh4tbGqoW77k0/M1VcePFKxPW0nxZUjx6ZP5e3alLlt0lrsW7N+StZ6Y7t6+herX0tzArYuLTrInHSnIZ/nn7djS3FBferYICwtUgTaxRjEWIOMsRFgCaqsqtmRvIO47crIp96eOFZ4M1nr2gEP79+ZuyyGyRw8dOH7kEPaTxwoxUpdYK9s3Z1GLiCa79M3BgaITR48UHGhvbamqKGWPhUv2jLLiM9TW1JQlt2/dItB7credq6kKEFB0qqy4aO3KpRivXrlcsC+PD6j83TsfDg9zUjx9/ChJzaJhCcLoofw9zY31EF94cB8EzOYoR0BYAjh78ZFNfaBWFJ8+sX3zxrQVn6etWJqRtiI7Y+2ubZvZCTLSVrICsOdu3VRy5jSln42IGFETyD4IYCkQtary0n27d+zdtf2Ly5c42FB5iDJHC85UvT1Xif7p40fydm4VAeXFZ/igraksgxZuwbcY88AuBGxYlwp55SVnKHd8gh07fIASvz1n492hofzd3grwnn7uICwBAq/Ei+ndyNm+vt6aKurJjk2Z6fvzdqL39/WxMdIreMOCm+fQ7dsMIeLonH8gQ9sm9R1qCTc7AWft+/fuQRiHRSzw9+TxY3wYyMlEZwzSv/96H5+vbB5U/8Dw4WGmGh5+wHDOUehMoof0bj938BoCHBINR0CS4QhIMhwBSYYjIMl4hYCKyuoNmdmzVpovtOo5+/sHMrM2zVo5dPionjMavEJAyvLUP/yjP5m1sn3HLj1nXV2Dr2tWyY/f/UDPGQ0cAfGXt4sA3naWyHe/9455JD1nNJjzBMgyG2CeyhGQHDgCkgxHQJLhCIgdww8feto04AiIEUR/Sp9O4eAICIAuT4sO+Dc2Nn0yb+GJE6f5wPasUaCr66LP3xEQAC8/b/4irxECona2uJSU1xULuT//08VpazJ+8MOfKqB0odC7MzcvXGnC/vff+vaGzGyvHYQjIABeHmPKitVe2wKjSHPC2tDYTNZ3Xwz8NTmhTM/IPHiwcHPONjUrKqvpIrjQkLE+Kzj0FeDzL//6fe6ScAJyd+2pq2/wie3w4X99NDAwyMDDh49+7et/a+wa+L3gU85fsAidq7rMPBJjN/cqLi5bvmK1PZuRyAQofykmX/v63/zpn/01PrIb9A8OEjK4wTN19To8A8b+AVhB9uzdT2RpfjLvs4VLUtDljKLhBhi/8c1/5NasFZq6L4g/AfX1jV6HBdP77k9/7pmC6Oq+aLo0EAf0zKxN6FzVFfT9CsbuuxdMyG5LZAKIOywSDoyk+Xe/944vdtQfYqoo5+buOXmyiJtSfORG1mdnb8HCajhw4DBsYcSfUcHRHrg1M4sDBn74249MuBNFwIqVaYTShNv0lpSUqZds7e4OLGdF3AyclACMDMHCEPRvfuvbsj8MRoEuVhUK0AKyJTIBZD1NNgCiRoGmuKN4fS9BNAlczpbtv/nwdxqOp7rEHEJ5mffpYhaB6bJBcHX3svJKFSKtJJAoAkxY5WN67aZierjwmJoaSCjRfQQgTIgFH2NBsADpvvsaiUwA4aZJesIBQSE6WPLzD/pSGGLy9u7nTUnzHTt3HywIXLFvzM45caoIPXfX3qXLVlFeuIuGCIcLj2ZmbWY4Sy0zK4f59dM34zajBJCe6CaIvphSCoK+gUqiTSJKArQNhA6RvHYTVtyJEQn+0e/nkcKLFi8jXqZMCxQoLMQaDqj4+JeXV9EkvvkHCtiisfiiDx/ci3rFlegTYjHB1fOYYQJ8QfQ1KUqshqC7hygJsBE9AUSH2fS0RIQiQ4ghg4PNvOAmT8nGEhz6FeAAI5WE6BNK9gCmDa1aADflO7yyczAbxwSarC22Ae5bXFKGPosIsIU40hUlAdLDzRaOAF5eGwDy7k9+tnnLdl4EAnJz8/7zR++lrVlPRHCws1Vgnp//8rcEl0rFQOLrWyuAgvbe+7+C1HXrNhB0JseNRQAHDNRNmR8mZpQANk90c/LRzpksAgDvT/ISZXKZDEUgYNv2XAoRPhx2qfsoRE3+AvNAEgFNW5Ouk6u9YTAnrGA/daoIIhnOhMyAP/eCGCwQY3idUQKQR8F/l6wDu4p+aNFAYiBA7HIuMr2SCCuA2STZm7Yo/QkQNLz/wa+JPvsq2cqWgD9jNQmFhR1iZ+5u9l78qUXswywIw4F2dQYibA//+/F8/LXDI3xJcGA192XpzDQBqvJ8gv3mtx/pEGnOlLZEQwAsYgHG4mtKwhFAqhIRVSGChU5wkbS1GWyqJCzrwJQLFRmCy6kGOzH9/ccL6CVqNLliZyw+pLaGLF6Sot5Tp87ABL0MZ1oxahbBTBNAuLUIBBaB6bIlGgJkAcaimX2fAhFKEIAGdmNCI0HP2LBRPkuXrpQCN3LGgTCxMohm9qatBJHIsgJ27d6L3awSkcoVnlCobwcLCgm3uYtdsuJPAIuXwJm8RrfjiNBF3PkiMz9RCBWCyyjDIsIoLPaQUIvv1pLIBJC5fJcSo2DF2IROuVi/PvvXv/kd2UoBwRkjPOFMNdfmjP/WbbnY8UHwoXBxLsKHtaIc54TKHvDf//PxmnUbmBNhJ6ALQTdsxZ+A2SYRCLBznx112fJUzuwNjU2cW5CsjZvnzV9IXMwoAkqyk9dpa9PZY+kiysiiJSnYYcV4YmG2pctWskpYLnDDeqJpbodoHbzVBAhkNylJ+MhQ4sLr6KdsRGTZ8lUkOOGmnkDJspRVfCKYrM/KzkFhIJ8OrAaIYQhC9FNT1/Gxhk7o+XDDQcsLZxTvxkE4Ar7UTkuqUl6IHcWa7ybCwYnlO//8b2T9gk8Xk7wpK1L/6bv/TsQ5/mesz4KPI8dO8O4cgYgyM8ANRBJlLB9/vADOoAH96LETzBnoXbBI2wP1yru3I4D0x041IEakJ+Hjc4kABY5Da9I3Bb+KecH/eOdH9BJ0ok+koEF7APszZGBBYcPAgcnZpXGAFaZiHroWLknh44AZuBG3Q7zbJ4IAdsINmZuonr7NkM+u4uIy3+8AJGy2PKjvh8mcUzHqmIQDc5oJmWHFyjTp2BHpCHe3t27ktSsAsHMSHdKTqBEIJGP9RnYIOKAoUd/J4uCZJwdnKhILhT2AcPPuUMJzMgMlCOawsFagE50rxySWBRPiw32hQXc0iD8BOoYK+tEmQlA805dfDgwMGg5QiLvX8fJAiZGvZVl07lTdVGTVa86jcpOuT+sYCCAxCTeKijsxJW3RA1vCitUMREh5PrvwwZi//yCENTQ26wOCXuwYKUrMw8EUH0o/oacXYU6RBCU6UBkkigDFwnyX6tcAhEZfv+bsyJqgyfkduwmcKMFI3HWotwkQN6EE4KkvuxgIMCCpiSDBUrnQaqBJ4EygcSg4VIid4sOyINCKKUHHjSt7OGdNFETzoNh130aiCEAxQSdnUWhitHVKCjqwP53wx0L08TRGQwAVLDjCT4CJPpgOAQJxJGoohg/GYiSFibV+EHSw4DDBbWxsonBp9ciBQDMWtgg6Rro0VTgkkABFTUUZhaYcBgYHqUIovl/ISLREVPqNaCrlvn6P5iNA0ff9ik0SAwGACPIMSm1TNFCo71kbc9hvd+/eBz18mm3fkcsZn+JjfIxCCYI8NcMhUQSQv4oatchHgI8hY7d7fUGUJyDEWkM+AoA+g1GmTwCJvOCzz3EjqWUhmnwlcCLKztmamraO09FHv5/HnowOVXw5b9m64wc//KnxB9hZHDyV1w6DRBGgMw8K4YhMgDnP2L2TEqDo00T3EaBNRW7mRpIYCCBt8eG9YEIWFBKffFdhoc4sTVlFCeILS/WH81La2gyqv1kBfFHzEcA8ySlBAqUci48AyoXsKkG+aqMS5GNFkTWsoINQXRNOnwBiwe5K4My7cOTHyLGH3Fd9p+Zg4YOZrCcCXNEZpUUAYYyFG+4VuQoligAqu/6CAYs2W3sTVv6yc6LDh73fas1qkzASJQE+piWxEcAxhlAyRMdQyj3RVy+WvL372YShgaMnTQWd3OczAg7wxAJ/dLFKkkOAbUEgg0DDhEJpElzOhJvPLtsZI1vuj3/yM1l8BNi3QDF6vAggfCYcxPG9939FcDn5KNCARcAGyzz6Qb/Kjr4buEvamgy5AXxMHZsUM0SAvRfZR0wUhVuQkZWBjyxaKzNMACDEVJvgTyb40vZ+546R7KZJxWcR8OmLvmPnbq6lZRUm0wklhZSP3pMniyKnP4g/AdxbUfMJb4KdQmSf+hE4oEs0hBo1FfyhmIH2LVCMjgO6NmQjsRFA2s6bvzAvb9/8TxeroB8uPErB4fAjB1YGE2qD7R8c1MagP3Sg9HOI4gMNhuQcAfEnYLZJbAQAPnTf++BXpDADEdUZgkshwki8ysoruUIP0Ved4SpWiMk73/+xKVkR4AiYMjj/KOIkOKxQ8XUSjQ2OgKmBuLPZpq1NJ+gLl6SQ7IuWpLAhe91ThyNgaiDi1HquxIv053iqDcDrnjocATFCW4Ku04EjIMlwBCQZjoAkwxGQZLylBLz7k5/NEjF/fvp2ETALxRGQZImdgDn0H+3zdc0qieYHRwavEOAw83AEJBmOgCTDEZBkOAKSDEdAkjHHCPCduEPlF7/80GdBvvkP32Fs4ZFX/nISCbWkrl7rs0g0g90riw3ThXRF/BMuG3NvBSgK9vuHWuwo/PwXAUpMLwpNjGoCOTOJ135pgR6vHRzlaS9nQOwo4+y7UZR48wngajcVPhNu0xuZABt4+iYB6AhGR0AANJFoCFCXbQGyiAB7rQh46o6IZwqugNDHiAZvaQliiHQCZ1sEDZfY0wp4GlJFksaGPkY0eJMJMGJnsQm3xLbIAWhUhBXAVbyqVxauWBwBAdBEtAJ8ULi5msjKoiAKGi4CQiFPeo2bWQc07ceIBm8vAV47agJM03jKDVHz7SLAvDZQNZgSAXZhkXMoAbYF/1AC9CSmGfoY0WCOEaDQGCEoPovvQ8wOdKhzqEUxnVRwtnuZUFuxaDZ2yaTcT4q5twLeMDgCkgxHQJLhCEgyHAFJhiMgyXAEJBmOgCTDT4D5NjEfeMB8gHhth/hh8hWgcJvPOQgQMWo6xBGTE+D7gYn9Qe8QX4QlQCnPlaYI0I8+ELs6OUwTYQnQVYoIECuiQcQ4TB+RCNAiIN9FALp2BXrdIogXIhEACD1xFwFcjeJWQLwwOQEKNFDBMU10u+kwfbxCgGoOih1iU4Kix+3bd65f7387hXf3ohAdXiHAnHNU6w1EgLokkfeAffkH16Vnvp2yf3+BF4XoMHkJcpgxTJcAFsdc2ZBZ1lrKXH1LXGBle5oFlWVfEaaJ0VTs6WBaBPAcc+s8yukuNJqCurzGqyDQ9hA8zSlRRVt6bIidAJNQbwyiIYCEM9EX6J1OFsZOAHfl3lJ4dFvEjdHlD2TRO6DgI0VGM4/SSgvciM+Z2cwtkL/4q29IMaNQjI6/0TU5gkVPBWSR+OIL8DQE0Kv72m6hQ6JH7ATwHCa46HofKYhihMKzBl0CwF/PahTBvKGGayzAjSbKpM5AnroFuppGMaNw0LSy05Qi2Hau5l0M7DtqKhQmN272400VCSHAfgcezrih8AIS89A40+RqdDM2lADbGdiBQ0eRoOsxgl5eiCXqRdQFcNNdzDx2L7Cnkg+w3ZJDALc3kTLvIIUu80z2wxFQNY3C++Bv3lDDzWzqQpnU2by/L3BSRDZXLPijYPR5CqapXnN3A3NHYHo1p4z2O04VcdiE9WIITyaFLp7J6PIHsuCvXobLIjF/VcgQrn/+l38nPbKzZNI9wDwYim03ivdYLx9MomhyO7Gih0H0skBN9QLdSHoMiJ0AwI2nc+/pgPva1JroTAeE1dOihujxGjFhWgQAAmGn0tyFVthUiZxm9MF0CXCYJhwBSYYjIMmYGgHj4+PPHeIEhXQKBIyOjtXU1lbXOImDlFdUXu25RlSnQMDw8HBLi/cfDXOYJoaG7rZ3dKI4ApIDR0CSEQcCrly50tR8YTrS0tL27Nkzb7q3DHEggG3kwYMHD6eBpqam+/fve9O9ZYgDAVXVNRMTE14jJrS2tTkCHAHJgSMgyXAEJBmOgCTj9QTo91D2z/odAXHEawgwv7fT7+cER0AcEZYA/YrR/MLP/o2jIyCOCEuAEt8Wr8MREFc4ApKM15QgA1eCEgRHQJLhSlCS4QhIMqItQTYcAXFEtCvA7QEJQrQrwP5TPUdAHBGWABtE3/0oIkGIigAfZoyAx48f3713780Q8wdYPkQiQD8HRez0BzNGwODgjfaOjjdDRkdHvbd6FWEJMNEP5cBHQGNTc0VlVWVVdcxSU1M7MjLiTZcY+HIoGkzzH1xEiWg34QinoBfxgDdXYhBD9AU2v0T/o4c4rIBZDpPI5ncbCBb9QwzE/NsjWzenvpjJixJx2ANmOYi1+TdMYsK8Dk3ebmN2Dg5EnKvyHQfjY5hIECIRoOhLPFMQc4sARVa6TQC6RL12yosPNe3hicCbX4JMiLmaBDdXHwEm9DYBUhKESAR4WhD2c8zRPcBOKSy8kXQUmjLiJiNis5U4hCXAx7yeBvCUc4sAQBBNagN0xfq1wM28eIIQlgCTCKEy5wgAMSSyWToJxdtCwKxFBAL+eFL+52IJms0IS4Av+nbTERBHTKEEeR2OgLjCEZBkuBKUZERaAT4ODBwBcYRbAUmG2wOSDEdAkhGWAGHSbcAREEe4FZBkOAKSjLAEuFPQzOA1e8CkcATEEZEIML9C8v0w3REQR4QlwEQ/lANHQBzh9oAkw62AJMNPAIE2sTYcoLgVkCD4CfAluyAmvIYjIK7wE+D7axStAIlncgTEFX4Cul7+dar+KAMldEE4AuKIsJuw/nDMa7wKR0Ac4SfA3mzD6Y6AOGKSTTicyAE4AuIIR0CSEakE2YhvCZqYmHj0pmBsbMx7q5gQdhOOgOkTMDIy0tTc/GZIb2+f91YxITkExAzOZvr3FIlD6LE7oZhLBFAGE/3X+oBb+L5GE4q5RIByExp8RwMp2qWMXT8+MWJGEV81fRY76DOwzgzmDAH2P2tRsAgcolDqA15GdEVQDj5/RETapcaOPjADZwBzhgAiMikB6AoWATUkhSOAXnT1mtkAFq0GNeUpPdF4E1aAmgqffBRiOdj+yno1Q1cAV/mbgTOAuboHcKWpoCt5sahLol6EUHI1XaZpLBuzc6Qgwft4/ElPNOYSAYqa15gM9JrAKaljADPEPDYGzCUCwAzkpl2aZgCxEDA6Olpbe67GSTykorK6Z6r/IzcwPj7+zCFO0H+tZ2oEOMQZX375/44wp4n/GW1uAAAAAElFTkSuQmCC"/>
					<div style="position: absolute; left:189mm; top:4mm; font-size:8pt;">ф.112ЭП</div>
					<div style="position: absolute; left: 54mm; top:7mm; width:85mm; height:37mm; border:1px dotted gray; color:gray; text-align:center; font-size:10pt;">
						<br/><br/><br/><br/>
						Зона оттиска ККМ
					</div>
					<div style="position: absolute; left: 151mm; top:7mm; width:37mm; height:37mm; border:1px dotted gray; color:gray; text-align:center; font-size:10pt;">
						<br/><br/><br/>
						Зона<br/>
						нанесения двумерного<br/>
						матричного кода
					</div>
					
					<div style="position: absolute; left: 10mm; top:50mm; width:186mm; height:98mm; border:0.5mm solid black;">
					
						<div style="position: absolute; left: 3mm; top: 1mm; width:44mm; height:5mm;font-size:3.75mm; font-weight:bold; text-align:center;">ПОЧТОВЫЙ ПЕРЕВОД</div>
						
						<!-- сумма цифрами -->
						<div style="position: absolute; left: 3mm; top: 6mm; width:44mm; height:4mm; text-align:center; font-size:2mm;">	
							<xsl:text>на</xsl:text>
							<span style="display:inline-block; width:17mm; height:3.5mm; font-size:3mm; border-bottom:1px solid black; font-family: Arial;">
								<xsl:value-of select="substring-before(mpost:Amount,'.')"/>
							</span>
							<xsl:text> руб.</xsl:text>
							<span style="display:inline-block; width:12mm; height:3.5mm; font-size:3mm; border-bottom:1px solid black; font-family: Arial;">
								<xsl:value-of select="substring-after(mpost:Amount,'.')"/>
							</span>
							<xsl:text>коп.</xsl:text>
						</div>
						
						<!-- сумма прописью -->
						<div style="position: absolute; left: 48mm; top:1mm; width:136mm; height:5mm; border:1px solid black; background-color:#ddd; font-size:8pt; font-family: Arial; line-height:15pt;">
							<xsl:apply-templates mode="sumWords" select="mpost:Amount"/>
						</div>
						<div style="position: absolute; left: 48mm; top: 6.5mm; width:136mm; height:5mm; font-size:1.2mm; text-align:center;">(Рубли прописью, копейки цифрами)</div>
						
						<!-- наложенный платеж -->
						<div style="position: absolute; left:2.5mm; top:10mm; width:43mm; height:11mm; font-size:3.75mm; font-weight:bold; border:1px solid black; background-color:#ddd;">
							<div style="position: absolute; left:1mm; top:1mm; width: 7mm; height:8mm; border: 1px solid black; background-color:white; font-family:Arial; font-size:6mm; text-align:center; font-weight: normal; line-height: 25pt;">
								<xsl:if test="mpost:CODIndicator = 1 or mpost:CODIndicator = 'true'">X</xsl:if>
							</div>
							<div style="position: absolute; left:10mm; top:1mm; width:33mm; height:11mm; font-size:3.75mm; font-weight:bold; text-align: center;">
								НАЛОЖЕННЫЙ<br/>ПЛАТЕЖ
							</div>
						</div>
						
						<!-- доставка -->
						<div style="position:absolute;left:47mm; top:9mm; width:36mm; height:6mm; border:1px solid black;">
							<div style="position:absolute; left:0.5mm;top:0.25mm;width:5mm;height:5mm; border:1px solid black; font-family: Arial;text-align: center;">
								<xsl:if test="mpost:HomeDeliveryIndicator = 1 or mpost:HomeDeliveryIndicator = 'true'">X</xsl:if>
							</div>
							<div style="position:absolute; left:6mm;top:1mm;width:30mm; font-size: 9pt; font-weight: bold;">с доставкой на дом</div>
						</div>
						<div style="position:absolute;left:47mm; top:15.25mm; width:36mm; height:6mm; border:1px solid black;background-color: white;">
							<div style="position:absolute; left:0.5mm;top:0.25mm;width:5mm;height:5mm; border:1px solid black; font-family: Arial;text-align: center;">
								<xsl:if test="mpost:NotificationIndicator = 1 or mpost:NotificationIndicator = 'true'">X</xsl:if>
							</div>
							<div style="position:absolute; left:6mm;top:1mm;width:30mm; font-size: 9pt; font-weight: bold;">с уведомлением</div>
						</div>
						
						<!-- SMS -->
						<!-- верхний -->
						<div style="position:absolute; left:84mm; top:9mm; width:52mm; height:6mm; border:1px solid black;background-color:white;font-size:7pt;" align="right">SMS о поступлении почтового перевода в ОПС<br/>выплаты, № мобильного телефона адресата</div>
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'136'"/>
							<xsl:with-param name="top" select="'9'"/>
							<xsl:with-param name="width" select="'4'"/>
							<xsl:with-param name="height" select="'6'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'12'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/RUScat_ru:CommunicationDetails/cat_ru:Phone[1]"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- нижний -->
						<div style="position:absolute; left:84mm; top:15.25mm; width:52mm; height:6mm; border:1px solid black;background-color:white;font-size:7pt;" align="right">SMS о выплате почтового перевода получателю<br/>№ моб. тел. отправителя</div>
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'136'"/>
							<xsl:with-param name="top" select="'15.25'"/>
							<xsl:with-param name="width" select="'4'"/>
							<xsl:with-param name="height" select="'6'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'12'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/RUScat_ru:CommunicationDetails/cat_ru:Phone[1]"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						
						<!-- Кому -->
						<div style="position:absolute; left:3mm; top:24mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">Кому: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="mpost:Payee/cat_ru:OrganizationName"/>
								<xsl:if test="not(mpost:Payee/cat_ru:OrganizationName) and mpost:Payee/cat_ru:ShortName">
									<xsl:value-of select="mpost:Payee/cat_ru:ShortName"/>
								</xsl:if>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top: 29mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(для юридического лица-полное наименование, для физического лица-Фамилия, Имя, а также Отчество (если иное не вытекает из закона или национального обычая) полностью)</div>
						
						<!-- Куда -->
						<xsl:variable name="address">
							<xsl:apply-templates mode="address" select="mpost:Payee/RUScat_ru:SubjectAddressDetails[1]"/>
						</xsl:variable>
						<div style="position:absolute; left:3mm; top:32.75mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">Куда: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address, 1, 100)"/>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top:38mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(полный адрес получателя)</div>
						<div style="position:absolute; left:3mm; top:39.25mm; width:180mm; height:5mm; border-bottom:1px solid black;">
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address, 101, 100)"/>
							</span>
						</div>
						<!-- индекс -->
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'160'"/>
							<xsl:with-param name="top" select="'37.75'"/>
							<xsl:with-param name="width" select="'4'"/>
							<xsl:with-param name="height" select="'6'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'6'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/RUScat_ru:SubjectAddressDetails[1]/RUScat_ru:PostalCode"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<div style="position: absolute; left: 160mm; top:44mm; width:24mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(индекс)</div>
						
						<!-- Сообщение -->
						<div style="position: absolute; left:3mm; top:45mm; width:24mm; height:11mm; border: 1px solid black; font-weight:bold; font-style: italic; text-align:center; line-height: 15pt;">
								Сообщение
								<br/>
								<span style="font-size:7pt;">
									или реквизиты л/с
								</span>
						</div>
						<!-- строка 1 -->
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'30'"/>
							<xsl:with-param name="top" select="'45'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'35'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:TextMessage"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- строка 2 -->
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'30'"/>
							<xsl:with-param name="top" select="'51.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'35'"/>
							<xsl:with-param name="index" select="'36'"/>
							<xsl:with-param name="node" select="mpost:TextMessage"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						
						<!-- банковские реквизиты -->
						<div style="position: absolute; left: 3mm; top:57mm; width:181mm; height:21mm; border:1px solid black;"></div>
						<div style="position: absolute; left: 3mm; top:57mm; width:59mm; height:3mm; border:1px solid black; font-size:7pt; background-color:#ddd; text-align:center;">заполняется при приеме перевода на расчетный счет</div>
						<!--ИНН-->
						<div style="position:absolute; left:5mm; top:61mm; width:15mm; height:5mm; font-style:italic; font-weight:bold;">ИНН:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'19'"/>
							<xsl:with-param name="top" select="'60'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'12'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- Кор/счет -->
						<div style="position:absolute; left:74mm; top:61mm; width:20mm; height:5mm; font-style:italic; font-weight:bold;">Кор/счет:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'96'"/>
							<xsl:with-param name="top" select="'60'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'20'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/RUScat_ru:BankInformation/cat_ru:CorrAccount"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- Наименование банка -->
						<div style="position:absolute; left:3mm; top:66mm; width:181mm; height:4mm; border-bottom:1px solid black;text-indent:2mm;">
							<span style="font-style:italic; font-weight:bold;"> Наименование банка: </span>
							<span style="font-family:Arial;">
								<xsl:value-of select="mpost:Payee/RUScat_ru:BankInformation/cat_ru:BankName"/>
							</span>
						</div>
						<!-- Расчетный счет -->
						<div style="position:absolute; left:4.5mm; top:74mm; width:35mm; height:5mm; font-style:italic; font-weight:bold;">Расчетный счет:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'38'"/>
							<xsl:with-param name="top" select="'73.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'20'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/RUScat_ru:BankInformation/cat_ru:BankAccount[1]"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- БИК -->
						<div style="position:absolute; left:133mm; top:74mm; width:35mm; height:5mm; font-style:italic; font-weight:bold;">БИК:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'144.25'"/>
							<xsl:with-param name="top" select="'73.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'9'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payee/RUScat_ru:BankInformation/cat_ru:BICID"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						
						<!-- Кому -->
						<div style="position:absolute; left:3mm; top:24mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">Кому: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="mpost:Payee/cat_ru:OrganizationName"/>
								<xsl:if test="not(mpost:Payee/cat_ru:OrganizationName) and mpost:Payee/cat_ru:ShortName">
									<xsl:value-of select="mpost:Payee/cat_ru:ShortName"/>
								</xsl:if>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top: 29mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(для юридического лица-полное наименование, для физического лица-Фамилия, Имя, а также Отчество (если иное не вытекает из закона или национального обычая) полностью)</div>
						
						<!-- От кого -->
						<div style="position:absolute; left:3mm; top:79mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">От кого: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="mpost:Payer/cat_ru:OrganizationName"/>
								<xsl:if test="not(mpost:Payer/cat_ru:OrganizationName) and mpost:Payer/cat_ru:ShortName">
									<xsl:value-of select="mpost:Payer/cat_ru:ShortName"/>
								</xsl:if>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top: 84mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(для юридического лица-полное наименование, для физического лица-Фамилия, Имя, а также Отчество (если иное не вытекает из закона или национального обычая) полностью)</div>
						
						<!-- Адрес отправителя -->
						<xsl:variable name="address2">
							<xsl:apply-templates mode="address" select="mpost:Payer/RUScat_ru:SubjectAddressDetails[1]"/>
						</xsl:variable>
						<div style="position:absolute; left:3mm; top:85.75mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">Адрес отправителя: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address2, 1, 90)"/>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top:91mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(юр.лицо-фактический почтовый адрес, физ.лицо-адрес места нахождения/пребывания)</div>
						<div style="position:absolute; left:3mm; top:91mm; width:180mm; height:5mm; border-bottom:1px solid black;">
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address2, 91, 100)"/>
							</span>
						</div>
						<!-- индекс -->
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'160'"/>
							<xsl:with-param name="top" select="'90.75'"/>
							<xsl:with-param name="width" select="'4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'6'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/RUScat_ru:SubjectAddressDetails[1]/RUScat_ru:PostalCode"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<div style="position: absolute; left: 160mm; top:95.5mm; width:24mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(индекс)</div>
						
					</div>
					
					<div style="position: absolute; left: 10mm; top:151mm; width:186mm; height:135mm; border:0.5mm solid black;">
					
						<!-- Адрес регистрации отправителя -->
						<xsl:variable name="address3">
							<xsl:apply-templates mode="address" select="mpost:Payer/RUScat_ru:SubjectAddressDetails[1]"/>
						</xsl:variable>
						<div style="position:absolute; left:3mm; top:0.75mm; width:180mm; height:5mm; border-bottom:1px solid black;background-color:white;">
							<span style="font-weight: bold; font-style: italic;">Адрес регистрации отправителя: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address3, 1, 80)"/>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top:6mm; width:156mm; height:5mm; font-size:2mm; text-align:right; font-style:italic;">(юр.лицо-адрес местонахождения по месту государственной регистрации, физ лицо-адрес места жительства/регистрации, заполняется при несовпадении</div>
						<div style="position: absolute; left: 3mm; top:7mm; width:156mm; height:5mm; font-size:2mm; text-align:right; font-style:italic;">с адресом отправителя, а также до востребования или на а/я)</div>
						<div style="position:absolute; left:3mm; top:6.25mm; width:180mm; height:5mm; border-bottom:1px solid black;">
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring($address3, 81, 100)"/>
							</span>
						</div>
						<!-- индекс -->
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'160'"/>
							<xsl:with-param name="top" select="'5.75'"/>
							<xsl:with-param name="width" select="'4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'6'"/>
							<xsl:with-param name="index" select="'1'"/>
							<!--xsl:with-param name="node" select="mpost:Payer/RUScat_ru:SubjectAddressDetails[1]/RUScat_ru:PostalCode"/-->
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<div style="position: absolute; left: 160mm; top:11mm; width:24mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(индекс)</div>
						
						<!-- банковская информация -->
						<div style="position:absolute; left:2mm; top:14mm; width:182mm; height:29mm; border:1px solid black;"></div>
						<div style="position: absolute; left: 2mm; top:14mm; width:118mm; height:3mm; border:1px solid black; font-size:7pt; background-color:#ddd; text-align:center;">заполняется при приеме перевода от физического лица с расчетом наличными денежными средствами</div>
						<!--ИНН-->
						<div style="position:absolute; left:5mm; top:18mm; width:15mm; height:5mm; font-style:italic; font-weight:bold;">ИНН:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'19'"/>
							<xsl:with-param name="top" select="'17'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'12'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- Кор/счет -->
						<div style="position:absolute; left:74mm; top:18mm; width:20mm; height:5mm; font-style:italic; font-weight:bold;">Кор/счет:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'96'"/>
							<xsl:with-param name="top" select="'17'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'20'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/RUScat_ru:BankInformation/cat_ru:CorrAccount"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- Наименование банка -->
						<div style="position:absolute; left:3mm; top:23mm; width:181mm; height:4mm; border-bottom:1px solid black;text-indent:2mm;">
							<span style="font-style:italic; font-weight:bold;"> Наименование банка: </span>
							<span style="font-family:Arial;">
								<xsl:value-of select="mpost:Payer/RUScat_ru:BankInformation/cat_ru:BankName"/>
							</span>
						</div>
						<!-- Расчетный счет -->
						<div style="position:absolute; left:4.5mm; top:31mm; width:35mm; height:5mm; font-style:italic; font-weight:bold;">Рас/счет:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'23'"/>
							<xsl:with-param name="top" select="'30.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'20'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/RUScat_ru:BankInformation/cat_ru:BankAccount[1]"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- БИК -->
						<div style="position:absolute; left:133mm; top:31mm; width:35mm; height:5mm; font-style:italic; font-weight:bold;">БИК:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'144.25'"/>
							<xsl:with-param name="top" select="'30.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'9'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/RUScat_ru:BankInformation/cat_ru:BICID"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!-- ОГРН -->
						<div style="position:absolute; left:4.5mm; top:36mm; width:35mm; height:5mm; font-style:italic; font-weight:bold;">ОГРН:</div>
						<xsl:call-template name="comb">
							<xsl:with-param name="left" select="'19'"/>
							<xsl:with-param name="top" select="'35.25'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'15'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						<!--платежное поручение-->
						<div style="position:absolute; left:87mm; top:36mm; width:100mm; height:5mm; font-style:italic">Платежное поручение № ________ дата __________</div>
						<div style="position: absolute; left: 125mm; top:40.5mm; width:60mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(при безналичной форме оплаты)</div>
						
						<!-- данные отправителя -->
						<div style="position:absolute; left:2mm; top:43mm; width:182mm; height:48mm; border:1px solid black; background-color: white;"></div>
						<div style="position: absolute; left: 2mm; top:43mm; width:77mm; height:3mm; border:1px solid black; font-size:7pt; background-color:#ddd; text-align:center;">данные отправителя (физ.лица)/представителя отправитля юр.лица</div>
						<div style="position:absolute; left:3.5mm; top:46mm; width:180mm; height:4mm; font-weight:bold;">
							<xsl:text>Предъявлен: </xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:39mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:value-of select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/>
							</span>
							<xsl:text> Серия</xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:13mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:value-of select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/>
							</span>
							<xsl:text> №</xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:18mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:value-of select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/>
							</span>
							<xsl:text> выдан</xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:52mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:IdentityCardDate"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="position: absolute; left: 22mm; top:49.5mm; width:50mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(наименование документа, удостоверяющего личность)</div>
						<div style="position: absolute; left: 120mm; top:49.5mm; width:60mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(дата выдачи)</div>
						
						<div style="position: absolute; left:3mm; top:52mm; width:180mm; height:3.5mm; border-bottom:1px solid black;"></div>
						<div style="position: absolute; left:3mm; top:51.5mm; width:120mm; height:3.5mm; text-align:center; font-family:Arial;">
							<xsl:value-of select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:OrganizationName"/>
						</div>
						<div style="position: absolute; left:123mm; top:51.5mm; width:60mm; height:3.5mm; text-align:center; font-family:Arial;">
							<xsl:value-of select="mpost:Payer/RUScat_ru:IdentityCard/RUScat_ru:IssuerCode"/>
						</div>
						<div style="position: absolute; left: 3mm; top:56mm; width:120mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(наименование учреждения, выдавшего документ)</div>
						<div style="position: absolute; left: 120mm; top:56mm; width:60mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(код подразделения, если имеется)</div>
						
						<div style="position: absolute; left: 3mm; top:61mm; width:180mm; height:5mm; font-weight:bold;">
							<xsl:text>Гражданство</xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:36mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:choose>
									<xsl:when test="mpost:Payer/mpost:ResidentIndicator = 1 or mpost:Payer/mpost:ResidentIndicator = 'true'">резидент РФ</xsl:when>
									<xsl:otherwise>нерезидент РФ</xsl:otherwise>
								</xsl:choose>
							</span>
							<xsl:text> дата рождения</xsl:text>
							<span style="display:inline-block;border-bottom:1px solid black;width:21mm; height:3.5mm ;text-align:center; font-weight: normal; font-family: Arial;">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpost:Payer/mpost:PayerBornDate"/></xsl:call-template>
							</span>
						</div>
						<div style="position:absolute; left:116mm; top:60mm; width:15mm; height:5mm; font-weight:bold; text-align:right; line-height:9pt;">ИНН<br/>
							<span style="font-size:5pt;">(при его наличии)</span>
						</div>
						<xsl:call-template name="cell">
							<xsl:with-param name="left" select="'131.25'"/>
							<xsl:with-param name="top" select="'60'"/>
							<xsl:with-param name="width" select="'4.4'"/>
							<xsl:with-param name="height" select="'5'"/>
							<xsl:with-param name="item" select="'0'"/>
							<xsl:with-param name="itemLimit" select="'12'"/>
							<xsl:with-param name="index" select="'1'"/>
							<xsl:with-param name="node" select="mpost:Payer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
							<xsl:with-param name="lineHeight" select="'20pt'"/>
						</xsl:call-template>
						
						<!-- для нерезидентов России -->
						<div style="position:absolute; left:3.5mm; top:66mm; width:180mm; height:9mm; border:1px solid black;"></div>
						<div style="position:absolute; left:4mm; top:65mm; width:51mm; height:2mm; font-size:2mm; text-align:center; background-color: white;">(Дополнительно для нерезидентов России заполняется)</div>
						<div style="position:absolute; left:4mm; top:67mm; width:26mm; height:7mm; text-align:right; line-height:10pt; font-weight: bold;">Миграционная<br/>карта:</div>
						<div style="position:absolute; left:32mm; top:67mm; width:53mm; height:7mm; line-height:10pt; font-weight: bold;">
							<br/>
							<xsl:text>Серия</xsl:text>
							<span style="display:inline-block; width:16mm; height:3mm; border-bottom:1px solid black; font-family: Arial; font-weight:normal; text-align:center; font-size:10pt;">
								<xsl:value-of select="mpost:Payer/mpost:NoResident/mpost:MigrationCardSeries"/>
							</span>
							<xsl:text> № </xsl:text>
							<span style="display:inline-block; width:16mm; height:3mm; border-bottom:1px solid black; font-family: Arial; font-weight:normal; text-align:center; font-size:10pt;">
								<xsl:value-of select="mpost:Payer/mpost:NoResident/mpost:MigrationCardNumber"/>
							</span>
						</div>
						<div style="position:absolute; left:83mm; top:67mm; width:14mm; height:7mm; line-height:10pt; font-weight: bold;">Дата<br/>выдачи</div>
						<div style="position:absolute; left:99mm; top:67mm; width:21mm; height:7mm; line-height:10pt; font-weight: bold;">
							<br/>
							<span style="display:inline-block; width:16mm; height:3mm; border-bottom:1px solid black; font-family: Arial; font-weight:normal; text-align:center; font-size:9pt;">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpost:Payer/mpost:NoResident/mpost:MigrationCardDate"/></xsl:call-template>
							</span>
						</div>
						<div style="position:absolute; left:117mm; top:67mm; width:22mm; height:7mm; line-height:10pt; font-weight: bold;">Срок<br/>пребывания</div>
						<div style="position:absolute; left:142mm; top:67mm; width:41mm; height:7mm; line-height:10pt; font-weight: bold;">
							<br/>
							<xsl:text>с</xsl:text>
							<span style="display:inline-block; width:16mm; height:3mm; border-bottom:1px solid black; font-family: Arial; font-weight:normal; text-align:center; font-size:9pt;">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpost:Payer/mpost:NoResident/mpost:DateBegin"/></xsl:call-template>
							</span>
							<xsl:text> по </xsl:text>
							<span style="display:inline-block; width:16mm; height:3mm; border-bottom:1px solid black; font-family: Arial; font-weight:normal; text-align:center; font-size:9pt;">
								<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="mpost:Payer/mpost:NoResident/mpost:DateEnd"/></xsl:call-template>
							</span>
						</div>
						
						<!-- ФИО -->
						<div style="position:absolute; left:3mm; top:75mm; width:180mm; height:5mm; border-bottom:1px solid black;">
							<span style="font-weight: bold;">ФИО: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="mpost:Payer/cat_ru:OrganizationName"/>
								<xsl:if test="not(mpost:Payer/cat_ru:OrganizationName) and mpost:Payee/cat_ru:ShortName">
									<xsl:value-of select="mpost:Payer/cat_ru:ShortName"/>
								</xsl:if>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top: 80mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(Фамилия, Имя, Отчество (если иное не вытекает из закона или национального обычая) полностью представителя юридического лица)</div>
						
						<!-- Адрес регистрации -->
						<div style="position:absolute; left:3mm; top:83mm; width:180mm; height:5mm; border-bottom:1px solid black;">
							<span style="font-weight: bold;">Адрес регистрации: </span>
							<span style="font-family: Arial; font-size:12pt;">
								<xsl:value-of select="substring(mpost:Payer/RUScat_ru:SubjectAddressDetails[1], 1, 100)"/>
							</span>
						</div>
						<div style="position: absolute; left: 3mm; top:88mm; width:180mm; height:5mm; font-size:2mm; text-align:center; font-style:italic">(адрес места жительства/регистрации представителя юридического лица)</div>
						
						<!-- подвал с текстом -->
						<div style="position:absolute; left:3.5mm; top:93mm; width:180mm; height:13mm; border-bottom:1px solid black; font-size:6.5pt;">
							Являетесь ли Вы должностным лицом публичных межтунородных организаций или лизом, замешающим (занимающим) государственные должности<br/>
							Российской Федерации, должности членов Совета директоров Центрального банка Российской Федерации, должности федеральной государственной<br/>
							службы, назначение на которые и освобождение от которых осуществляется Президентом Российской Федерации или Правительством Российской<br/>
							Федерации, должности в Центральном банке Российской Федерации, государственных корпорациях и иных организациях, созданных Российской<br/>
							Федерацией на основании Федеральных законов, включенных в перечни должностей, определяемые Президентом Российской Федерации
						</div>
						<div style="position:absolute; left:158mm; top:93mm; font-weight:bold;">
							<span style="display:inline-block;width:4mm; height:4mm; border:1px solid black; font-family: Arial; text-align:center; font-weight:normal;">
								<xsl:if test="mpost:ConsentReceiveInform = 1 or mpost:ConsentReceiveInform = 'true'">X</xsl:if>
							</span>
							Да
							<span style="display:inline-block;width:4mm; height:4mm; border:1px solid black; font-family: Arial; text-align:center; font-weight:normal;">
								<xsl:if test="mpost:ConsentReceiveInform = 0 or mpost:ConsentReceiveInform = 'false'">X</xsl:if>
							</span>
							Нет
						</div>
						<div style="position:absolute; left:162mm; top:103mm; font-weight:bold; font-size:9pt; font-weight:boldl;">Подпись</div>
						<div style="position:absolute; left:3mm; top:107mm; width:180mm; height:6mm; border-bottom:1px solid black;">
							<div style="position:absolute; left:0mm; top:0.5mm; width:4mm; height:4mm; border:1px solid black; text-align:center; font-family: Arial; line-height:11pt;">
								<xsl:if test="mpost:ConsentReceiveInform = 1 or mpost:ConsentReceiveInform = 'true'">X</xsl:if>
							</div>
							<div style="position:absolute; left: 5mm; top:0.5mm; font-size:6.5pt;">
								Согласен(на) на направление информации о новых сервисах и услугах, оказываемых в отделениях почтовой связи на указанный выше мною номер моб.телефо-<br/>
								на отправителя. Подтверждаю, что данный номер является моим номером моб.телефона, выделенным мне оператором сотовой связи.
							</div>
						</div>
						<div style="position:absolute; left:3mm; top:114mm; width:80mm; font-size:6pt;">
							В целях осуществления данного почтового перевода подтверждаю свое согласие:<br/>
							- на обработку как автоматизированным, так и неавтоматизированным способом<br/>
							указанных на бланке персональных данных;<br/>
							- на передачу информации о номере почтового перевода, о событиях (о поступлении<br/>
							почтового перевода в ОПС выплаты, о выплате почтового перевода, о перечислении<br/>
							почтового перевода на счет получателя, о дате и месте совершения события).<br/>
							Также подтверждаю свое согласие на передачу номера почтового перевода<br/>
							и событий третьему лицу в целях передачи SMS-сообщений по сетям связи.
						</div>
						<div style="position:absolute; left:87mm; top:125mm; font-size:7pt; font-weight:bold;">
							подпись<br/>
							отправителя
						</div>
						<div style="position:absolute; left:107mm; top:115mm; width:43mm; height:19mm; border:1px dotted gray;"></div>
					</div>
					
					<div style="position: absolute; left: 161.5mm; top:268.5mm; width:35mm; height:18mm; border-left:0.5mm solid black; border-top:0.5mm solid black; background-color:white;">
						<div style="position:absolute; left:3mm; top:12mm; width:29mm; font-size:2mm; text-align:center; font-style:italic; border-top:1px solid black;">(подпись оператора)</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<!-- шаблон "ячейка" -->
	<xsl:template match="*" name="cell">
		<xsl:param name="left"/>
		<xsl:param name="top"/>
		<xsl:param name="width"/>
		<xsl:param name="height"/>
		<xsl:param name="item"/><!-- от 0 -->
		<xsl:param name="itemLimit"/>
		<xsl:param name="index"/><!-- от 1 -->
		<xsl:param name="node"/>
		<xsl:param name="lineHeight"/><!-- указывать с ЕИ -->
		
		<div style="position:absolute; left:{$left + ($width * $item)}mm; top:{$top}mm; width:{$width}mm; height:{$height}mm; border:1px solid black;background-color:white; font-family:Arial; text-align:center; line-height:{lineHeight};">
			<xsl:value-of select="substring($node, $index, 1)"/>
		</div>
		
		<xsl:if test="($item + 1) &lt; $itemLimit">
			<xsl:call-template name="cell">
				<xsl:with-param name="left" select="$left"/>
				<xsl:with-param name="top" select="$top"/>
				<xsl:with-param name="width" select="$width"/>
				<xsl:with-param name="height" select="$height"/>
				<xsl:with-param name="item" select="$item + 1"/>
				<xsl:with-param name="itemLimit" select="$itemLimit"/>
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="node" select="$node"/>
				<xsl:with-param name="lineHeight" select="$lineHeight"/>
			</xsl:call-template>
		</xsl:if>
		
	</xsl:template>
	
	<!-- шаблон "гребень" -->
	<xsl:template name="comb">
		<xsl:param name="left"/>
		<xsl:param name="top"/>
		<xsl:param name="width"/>
		<xsl:param name="height"/>
		<xsl:param name="item"/><!-- от 0 -->
		<xsl:param name="itemLimit"/>
		<xsl:param name="index"/><!-- от 1 -->
		<xsl:param name="node"/>
		<xsl:param name="lineHeight"/><!-- указывать с ЕИ -->
		
		<!-- подложка -->
		<div style="position:absolute; left:{$left + ($width * $item)}mm; top:{$top + 3}mm; width:{$width}mm; height:{$height - 3}mm; border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black; background-color:white; font-family:Arial; text-align:center; line-height:{lineHeight};">
		</div>
		
		<!-- текст -->
		<div style="position:absolute; left:{$left + ($width * $item)}mm; top:{$top}mm; width:{$width}mm; height:{$height}mm; font-family:Arial; text-align:center; line-height:{lineHeight};">
			<xsl:value-of select="substring($node, $index, 1)"/>
		</div>
		
		<xsl:if test="($item + 1) &lt; $itemLimit">
			<xsl:call-template name="comb">
				<xsl:with-param name="left" select="$left"/>
				<xsl:with-param name="top" select="$top"/>
				<xsl:with-param name="width" select="$width"/>
				<xsl:with-param name="height" select="$height"/>
				<xsl:with-param name="item" select="$item + 1"/>
				<xsl:with-param name="itemLimit" select="$itemLimit"/>
				<xsl:with-param name="index" select="$index + 1"/>
				<xsl:with-param name="node" select="$node"/>
				<xsl:with-param name="lineHeight" select="$lineHeight"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
		
	<xsl:template match="*" mode="address">
		<xsl:for-each select="*">
			<xsl:if test="position() &gt; 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="sumWords" match="*">
		<xsl:variable name="splittedSum">
			<xsl:value-of select="translate(.,'.',',')"/>
		</xsl:variable>
		<xsl:variable name="integerPart">
			<xsl:choose>
				<xsl:when test="substring-before($splittedSum,',')!=''">
					<xsl:value-of select="substring-before($splittedSum,',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$splittedSum"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
		<xsl:choose>
			<xsl:when test="$integerPart!='0'">
				<xsl:call-template name="RecurseSumWords">
					<xsl:with-param name="Value" select="$integerPart"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
		<xsl:text> руб. </xsl:text>
		<xsl:if test="$fractionalPart!=''">
			<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
			<xsl:text> коп.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
