<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru c_inv" version="1.0" xmlns:c_inv="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialInvoice:5.24.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='CommercialInvoice']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <xsl:template match="*" mode="russian_date_gtd">
		   <xsl:variable name="xpath_date">
				   <xsl:call-template name="get_xpath">
						   <xsl:with-param name="node" select="."/>
				   </xsl:call-template>
		   </xsl:variable>
		   <element xml_node="{$xpath_date}">
				   <xsl:call-template name="russian_date_gtd">
						   <xsl:with-param name="dateIn" select="."/>
				   </xsl:call-template>
		   </element>
   </xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="c_inv:CommercialInvoice">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Счёт-фактура</title>
				<style type="text/css">
                    body {
                    text-align: center;
                    background: #cccccc;
                    }

                    div.page {
                        width: 297mm;
                        margin: auto;
                        padding: 5mm 10mm 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-before: always;
                        margin-top: 20px;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {
                        div.page {border: none; margin: 0; padding: 0;}
                    }

                    .bordered {
                    border: solid 1pt #000000;
                    padding-top:4pt;
                    padding-bottom:4pt;
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                    }

                    .underlined {
                    border-bottom: solid 0.8pt #000000;
                    }

                    p.NumberDate {
                    font-weight: bold;
                    }

                    .graph {
                    font-family: Arial;
                    font-size: 8pt;
                    }
                    .graphLittle {
                    font-family: Arial;
                    font-size: 7pt;
                    }
                    td {
                    font-family:Courier;
                    }

                    .graphMain {
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                    }
                    table.items {font-size: 9pt; border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; text-align: center; font-family: Arial; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                </style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" style="width: 100%;">
						<tr>
							<td align="center" class="graph">
								<h3 style="margin-top: 30px;">СЧЕТ-ФАКТУРА №
                                    <xsl:apply-templates select="c_inv:Registration/cat_ru:PrDocumentNumber"/>
                                    от <xsl:apply-templates select="c_inv:Registration/cat_ru:PrDocumentDate" mode="russian_date"/>
								</h3>
							</td>
							<td align="center" class="graph" style="width: 1%;">
								<h3>(1)</h3>
							</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">Продавец</span>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:apply-templates mode="org" select="c_inv:Seller"/>
							</td>
							<td align="center" class="graph">(2)</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">ИНН/КПП продавца  </span>
								<xsl:if test="c_inv:Seller/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:apply-templates select="c_inv:Seller/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:text>/</xsl:text>
								<xsl:if test="c_inv:Seller/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									<xsl:apply-templates select="c_inv:Seller/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
							</td>
							<td align="center" class="graph">(2б)</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">Грузоотправитель и его адрес</span>
								<xsl:apply-templates mode="org" select="c_inv:Consignor"/>
								<span class="graph">ИНН/КПП грузоотправителя  </span>
								<xsl:if test="c_inv:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:apply-templates select="c_inv:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:if test="c_inv:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="c_inv:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
							</td>
							<td align="center" class="graph">(3)</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">Грузополучатель и его адрес</span>
								<xsl:apply-templates mode="org" select="c_inv:Consignee"/>
								<span class="graph">ИНН/КПП грузополучателя  </span>
								<xsl:if test="c_inv:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:apply-templates select="c_inv:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:if test="c_inv:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									<xsl:text>.</xsl:text>
									<xsl:apply-templates select="c_inv:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
							</td>
							<td align="center" class="graph">(4)</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">К платежно-расчетному документу </span>
								<xsl:for-each select="c_inv:PayDocsRegistration">
									<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									<span class="graph"> № </span>
									<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
									<span class="graph"> от </span>
									<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
							<td align="center" class="graph">(5)</td>
						</tr>
						<tr>
							<td class="underlined">
								<span class="graph">Покупатель</span>
								<xsl:apply-templates mode="org" select="c_inv:Buyer"/>
							</td>
							<td align="center" class="graph">(6)</td>
						</tr>
						<tr>
							<td class="underlined" style="width:182mm;">
								<span class="graph">ИНН/КПП покупателя</span>
								<xsl:if test="c_inv:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:apply-templates select="c_inv:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</xsl:if>
								<xsl:text>/</xsl:text>
								<xsl:if test="c_inv:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
									<xsl:apply-templates select="c_inv:Buyer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</xsl:if>
							</td>
							<td align="center" class="graph">(6)</td>
						</tr>
						<tr>
							<td align="right" class="graph" colspan="2">
								<br/>
								<xsl:choose>
									<xsl:when test="c_inv:CurrencyCode or c_inv:CurrencyRate">
										<xsl:if test="c_inv:CurrencyCode">Код валюты:<u>
												<xsl:apply-templates select="c_inv:CurrencyCode"/>
											</u>
											<br/>
										</xsl:if>
										<xsl:if test="c_inv:CurrencyRate">Курс валюты:<u>
												<xsl:apply-templates select="c_inv:CurrencyRate"/>
											</u>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										Наименование и код валюты: <u>Российский рубль, RUR</u>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<br/>
					<table class="items" style="width:100%">
						<tr>
							<th>Наименование товара (описание выполненных работ, оказанных услуг), имущественного права</th>
							<th>Ед. изм.</th>
							<th>Количество (объем)</th>
							<th>Цена (тариф) за ед. изм.</th>
							<th>Стоим. товаров (работ, услуг), имущественных прав без налога - всего</th>
							<th>В том числе сумма акциза</th>
							<th>Налоговая ставка</th>
							<th>Сумма налога, предъявляемая покупателю</th>
							<th>Стоим. товаров (работ, услуг), имущественных прав, с налогом - всего</th>
							<th>Страна происх-я товара</th>
							<th>Номер ДТ</th>
						</tr>
						<tr>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>10</th>
							<th>11</th>
						</tr>
						<xsl:for-each select="c_inv:InvoiceGoods">
							<tr>
								<td style="text-align: left;">
									<xsl:for-each select="catComFin_ru:GoodsDescription">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td style="text-align: left;">
									<xsl:apply-templates select="catComFin_ru:MeasureUnitQualifierName"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:GoodsQuantity"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:GoodsPrice"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:GoodsCost"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:Exise"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:TaxRate"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:TaxSum"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:TotalCost"/>
								</td>
								<td style="text-align: right;">
									<xsl:apply-templates select="catComFin_ru:OriginCountryCode"/>
								</td>
								<td style="width:44mm">
									<xsl:apply-templates select="catComFin_ru:GTDID/cat_ru:CustomsCode"/>/<xsl:apply-templates select="catComFin_ru:GTDID/cat_ru:RegistrationDate" mode="russian_date_gtd"/>/<xsl:apply-templates select="catComFin_ru:GTDID/cat_ru:GTDNumber"/>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td colspan="4" style="text-align: left;">Всего к оплате</td>
							<td style="text-align: right;">
								<xsl:value-of select="format-number(sum(c_inv:InvoiceGoods/catComFin_ru:GoodsCost), '#.00')"/>
							</td>
							<td colspan="2"/>
							<td style="text-align: right;">
								<xsl:apply-templates select="c_inv:TaxSum"/>
							</td>
							<td style="text-align: right;">
								<xsl:apply-templates select="c_inv:TotalCost"/>
							</td>
							<td colspan="2"/>
						</tr>
					</table>
					<br/>
					<!-- подписи документа и реквизиты свидетельства о гос регистрации ИП -->
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td style="width:70mm;">
									<span class="graph">
                                        Руководитель организации или иное уполномоченное лицо 
                                    </span>
								</td>
								<td class="underlined" style="width:14mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="underlined" style="width:47.5mm;">
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:Director/cat_ru:PersonSurname"/> 
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:Director/cat_ru:PersonName"/> 
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:Director/cat_ru:PersonMiddleName"/>
								</td>
								<td style="width:10mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:70mm;">
									<span class="graph">Главный бухгалтер или иное уполномоченное лицо </span>
									<!--span class="graph">
                                        <xsl:apply-templates select="c_inv:ChiefAccountant/cat_ru:PersonPost"/>
                                    </span-->
								</td>
								<td class="underlined" style="width:14mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="underlined" style="width:40mm;">
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:ChiefAccountant/cat_ru:PersonSurname"/> 
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:ChiefAccountant/cat_ru:PersonName"/> 
									<xsl:apply-templates select="c_inv:SignatureDirectorChiefAccountant/c_inv:ChiefAccountant/cat_ru:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td style="width:70mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" style="width:14mm;" valign="top">
									<span class="graphLittle">(подпись)</span>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" style="width:47.5mm;" valign="top">
									<span class="graphLittle">(ф.и.о.)</span>
								</td>
								<td style="width:10mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:70mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<br/>
								</td>
								<td align="center" style="width:14mm;" valign="top">
									<span class="graphLittle">(подпись)</span>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" style="width:40mm;" valign="top">
									<span class="graphLittle">(ф.и.о.)</span>
								</td>
							</tr>
							<tr>
								<td style="width:70mm;">
									<span class="graph">Индивидуальный предприниматель</span>
									<!--span class="graph">
                                        <xsl:apply-templates select="c_inv:IndividualEntrepreneur/cat_ru:PersonPost"/>
                                    </span-->
								</td>
								<td class="underlined" style="width:14mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<xsl:choose>
									<xsl:when test="c_inv:IndividualEntrepreneur">
										<td align="center" class="underlined" style="width:100mm;">
											<text/>
											<xsl:apply-templates select="c_inv:IndividualEntrepreneur/cat_ru:PersonSurname"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
											<xsl:apply-templates select="c_inv:IndividualEntrepreneur/cat_ru:PersonName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
											<xsl:apply-templates select="c_inv:IndividualEntrepreneur/cat_ru:PersonMiddleName"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="underlined" style="width:10mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
								<td style="width:10mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<xsl:choose>
									<xsl:when test="c_inv:IndividualEntrepreneur">
										<td align="center" class="underlined" colspan="4" style="width:125mm;">
											<xsl:apply-templates select="c_inv:IndividualEntrepreneur/c_inv:OGRNID"/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td class="underlined" colspan="4" style="width:125mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td style="width:20mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
								</td>
								<td align="center" style="width:14mm;">
									<span class="graphLittle">(подпись)</span>
								</td>
								<td style="width:1mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" style="width:47.5mm;">
									<span class="graphLittle">(ф.и.о.)</span>
								</td>
								<td style="width:10mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" colspan="4" style="width:125mm;">
									<span class="graphLittle">
                                        (реквизиты свидетельства о государственной регистрации индивидуального предпринимателя)
                                    </span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<br/>
		<xsl:if test="cat_ru:Address">Адрес
		<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
				<xsl:apply-templates select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
			<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode"/>,
        <xsl:if test="cat_ru:Address/cat_ru:Region">
				<xsl:apply-templates select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
			<xsl:if test="cat_ru:Address/cat_ru:City">
				<xsl:apply-templates select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
			<xsl:apply-templates select="cat_ru:Address/cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<br/>
		<!--xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/-->
	</xsl:template>
</xsl:stylesheet>
