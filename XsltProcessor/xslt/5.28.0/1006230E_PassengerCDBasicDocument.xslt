<?xml version="1.0" encoding="utf-8"?>
<!-- с версии 5.15.0 - форма по Решению Коллегии ЕЭК от 23.07.2019 г. № 124 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cat_pcd="urn:customs.ru:Information:CustomsDocuments:PassengerCDCommonAggregateTypesCust:5.28.0" xmlns:pcd_bd="urn:customs.ru:Information:CustomsDocuments:PassengerCDBasicDocument:5.28.0">
	<!--xsl:variable name="Self" select='document("")'/-->
	<xsl:include href="SumInWords.xslt"/>
	<xsl:template match="pcd_bd:PassengerCDBasicDocument">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									@media print {
									.more {
											 page-break-before: always;
										} 
								    }
									body {
									background: #cccccc;
									font-family: Arial;
									font-size: 10pt;
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-size: 10pt;
									}

									.marg-top
									{
									margin-top:5mm;
									}

									table
									{
									width: 100%;
									border: 0;
									empty-cells: show;
									border-collapse: collapse;
									margin-top: 1px;
									}

									table td, table th
									{
										padding: 2px;
									}

									table.bordered tr td
									{
									border: 1px solid black;
									}

									.graph {
									font-family: Arial;
									font-size: 11pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									.title
									{
									font-weight:bold;
									font-family: Arial;
									font-size: 11pt;
									}

									table.bordered th
									{
									border: 1px solid black;
									font-weight:bold;
									font-family: Arial;
									font-size: 9pt;
									}

									td
									{
									font-family: Arial;
									font-size: 11pt;
									}
									div.title, tr.title td
									{font-weight:bold;  
									}

									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}
									td.border-bottom
									{
									border-bottom: solid 1px windowtext;
									vertical-align:bottom;
									}
									
									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									
									.graph_under {
									font-family: Arial;
									font-size: 7pt;
									text-align: center;
									vertical-align: top;
									}
									
									.delim_3 
									{
									font-size: 3pt;
									}
									
									.hr-dashed {
										margin: 2px 0;
										padding: 0;
										height: 0;
										border: none;
										border-top: 1px dashed windowtext;
									}
			</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<xsl:text>ПАССАЖИРСКАЯ ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</xsl:text>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<td align="left" class="bordered">
								<table width="100%" cellpadding="4">
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>Заполняется лицом, достигшим 16-летнего возраста.</xsl:text>
											</i>
										</td>
									</tr>
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>В случае утвердительного ответа в соответствующем поле проставляется знак "x" или "v".</xsl:text>
											</i>
										</td>
									</tr>
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>Экземпляр оформленной пассажирской таможенной декларации сохраняется на весь период временного </xsl:text>
												<xsl:text>пребывания на таможенной территории ЕАЭС (за ее пределами) и предъявляется таможенному органу при выезде (возвращении).</xsl:text>
											</i>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<br/>
					<div class="title">
						<xsl:text>1. Сведения о декларанте:</xsl:text>
					</div>
					<table>
						<tbody>
							<tr>
								<td width="32%" class="border-bottom" align="center">
									<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonSurname"/>
								</td>
								<td width="2%"> <br/></td>
								<td width="32%" class="border-bottom" align="center">
									<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonName"/>
								</td>
								<td width="2%"/>
								<td width="32%" class="border-bottom" align="center">
									<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td class="graph_under">(фамилия)</td>
								<td/>
								<td class="graph_under">(имя)</td>
								<td/>
								<td class="graph_under">(отчество)</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:PersonIdCard">
										<xsl:value-of select="RUScat_ru:IdentityCardName"/>
										<xsl:if test="not(RUScat_ru:IdentityCardName)">
											<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
										</xsl:if>
										<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:FullIdentityCardName">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:if test="RUScat_ru:CountryCode">
											<xsl:value-of select="RUScat_ru:CountryCode"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
										<xsl:if test="RUScat_ru:IdentityCardSeries and RUScat_ru:IdentityCardNumber">
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
										<xsl:if test="(RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber) and RUScat_ru:IdentityCardDate">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:if test="RUScat_ru:IdentityCardDate">
											<xsl:text>выдан </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(документ, удостоверяющий личность (наименование, страна выдачи, серия, номер, дата выдачи))</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pcd_bd:DeclarantPerson/pcd_bd:Address/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(адрес постоянного места жительства (регистрации) <i>(заполняется при ввозе (в том числе временном) транспортного средства, ввозе или вывозе наличных денежных средств и (или) денежных инструментов, транзите)</i></td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pcd_bd:DeclarantPerson/cat_pcd:RegAddress/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(адрес временного проживания (пребывания) в государстве - члене ЕАЭС <i>(заполняется иностранным лицом при ввозе (в том числе временном) транспортного средства, ввозе или вывозе наличных денежных средств и (или) денежных инструментов, транзите)</i></td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<xsl:if test="pcd_bd:DeclarantPerson/cat_pcd:INN">
									<td class="border-bottom" align="center">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:INN"/>
									</td>
									<td width="2%"/>
								</xsl:if>
								<td width="48%" class="border-bottom" align="center">
									<xsl:value-of select="pcd_bd:CountryDeparture/cat_pcd:CountryName"/>
								</td>
								<td width="2%"/>
								<td width="48%" class="border-bottom" align="center">
									<xsl:value-of select="pcd_bd:CountryDestination/cat_pcd:CountryName"/>
								</td>
							</tr>
							<tr>
								<xsl:if test="pcd_bd:DeclarantPerson/cat_pcd:INN">
									<td class="graph_under">(ИНН)</td>
									<td/>
								</xsl:if>
								<td class="graph_under">(страна отправления)</td>
								<td/>
								<td class="graph_under">(страна назначения)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="85%" class="graph">Со мной следуют лица, не достигшие 16-летнего возраста, в количестве</td>
								<td valign="top" class="border-bottom" width="5%" align="center">
									<xsl:choose>
										<xsl:when test="pcd_bd:Children/pcd_bd:Quantity"><xsl:value-of select="pcd_bd:Children/pcd_bd:Quantity"/></xsl:when>
										<xsl:otherwise><xsl:text>&#8212;</xsl:text></xsl:otherwise>
									</xsl:choose>
								</td>
								<td valign="top" width="10%" align="center" class="graph">чел.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div class="title">
						<xsl:text>Мной, следующими со мной лицами, не достигшими 16-летнего возраста, либо в мой адрес (от меня) перемещаются следующие товары и транспортные средства:</xsl:text>
					</div>
					<div class="delim_3"><br/></div>
					<div class="title">
						<xsl:text>2. Сведения о способе перемещения товаров и транспортных средств:</xsl:text>
					</div>
					<div class="delim_3"><br/></div>
					<table>
						<tbody>
							<tr>
								<td valign="top">2.1.</td>
								<td valign="top" width="20%"><xsl:text>Сопровождаемый багаж, включая ручную кладь</xsl:text></td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:AccompaniedLuggage/pcd_bd:HaveSign"/>
									</xsl:call-template>
								</td>
								<td valign="top">2.2.</td>
								<td valign="top" width="20%">
									<xsl:text>Несопровождаемый багаж (багаж, следующий отдельно от въезжающего/ выезжающего лица) </xsl:text>
									<i><xsl:text>(при въезде лица заполняется для учета норм ввоза товаров без уплаты платежей)</xsl:text></i>
								</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:UnaccompaniedLuggage/pcd_bd:HaveSign"/>
									</xsl:call-template>
								</td>
								<td valign="top">2.3.</td>
								<td valign="top" width="20%"><xsl:text>Доставляемые в адрес (пересылаемые) товары без въезда/выезда лица</xsl:text></td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:MovementGoodsAndTransportMeansInfo/pcd_bd:GoodsDeliveredByCarrier/pcd_bd:HaveSign"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title">
						<xsl:text>3. Сведения о товарах:</xsl:text>
					</div>
					<div class="delim_3"><br/></div>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="20%" align="right"><xsl:text>Ввоз (свободное обращение)</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='1'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="15%" align="right"><xsl:text>Вывоз</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='2'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="20%" align="right"><xsl:text>Временный вывоз</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='x'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="25%" align="right"><xsl:text>Транзит (для товаров, ввозимых со льготой)</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='3'"><b>X</b></xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.1. Наличные денежные средства и (или) дорожные чеки свыше 10 000 S в эквиваленте (на 1 лицо), векселя, чеки (банковские чеки), ценные бумаги &lt;*&gt;</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.2. Товары, ввозимые с освобождением от уплаты таможенных пошлин, налогов (ввоз со льготой)</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.3. Товары, стоимость, вес и (или) количество которых превышают нормы ввоза без уплаты таможенных пошлин, налогов</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:Goods/pcd_bd:GoodsIndivisibleHaveSign"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.4. Культурные ценности</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.5. Гражданское и служебное оружие, его основные (составные) части, патроны к нему</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.6. Наркотические средства, психотропные вещества, их прекурсоры в виде лекарственных средств</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.7. Животные, растения</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.8. Коллекционные материалы по минералогии, палеонтологии, кости ископаемых животных</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.9. Образцы биологических материалов человека</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.10. Другие товары, в отношении которых подлежат соблюдению запреты и ограничения и требуется представление подтверждающих документов и (или) сведений</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="false"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div class="title">
						<xsl:text>4. Дополнительные сведения о товарах, в том числе указанных в графах 3.2 - 3.10:</xsl:text>
					</div>
					<div class="delim_3"><br/></div>
					<table class="bordered">
						<tbody>
							<tr>
								<th width="5%" class="bordered" align="center" valign="top"><xsl:text>№ п/п</xsl:text></th>
								<th width="50%" class="bordered" align="center" valign="top">
									<xsl:text>Наименование товара и его описание (идентификационный номер и другие отличительные признаки), </xsl:text>
									<xsl:text>наименования, даты и номера документа, подтверждающего соблюдение условий ввоза с освобождением от </xsl:text>
									<xsl:text>уплаты таможенных пошлин, налогов, и (или) документа, подтверждающего соблюдение ограничений, </xsl:text>
									<xsl:text>а также наименования органов, выдавших такие документы</xsl:text>
								</th>
								<th width="25%" class="bordered" align="center" valign="top">
									<xsl:text>Вес (с учетом фактически перемещаемой первичной упаковки) (кг)/количество (л, шт.)</xsl:text>
								</th>
								<th width="20%" class="bordered" align="center" valign="top">
									<xsl:text>Стоимость (в валюте государства - члена ЕАЭС, евро или долларах США)</xsl:text>
								</th>
							</tr>
							<xsl:for-each select="pcd_bd:Goods/pcd_bd:PassDeclGoodsInfo/pcd_bd:PassDeclGoods">
								<tr>
									<td class="bordered" align="center" valign="top">
										<xsl:value-of select="pcd_bd:GoodsNumeric"/>
									</td>
									<td class="bordered" valign="top">
										<xsl:apply-templates select="pcd_bd:GoodsDescription"/>
										<br/>
										<xsl:for-each select="pcd_bd:PresentedDocuments">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:value-of select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:value-of select="pcd_bd:OrganizationName"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" valign="top">
										<xsl:value-of select="pcd_bd:GoodsWeightQuantity"/>
										<xsl:text> кг</xsl:text>
										<xsl:if test="pcd_bd:GoodsWeightQuantity and pcd_bd:GoodsQuantity"> / </xsl:if>
										<xsl:value-of select="pcd_bd:GoodsQuantity/pcd_bd:Quantity"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:GoodsQuantity/pcd_bd:MeasureUnitOperation"/>
									</td>
									<td class="bordered" valign="top">
										<xsl:value-of select="translate(translate(format-number(pcd_bd:GoodsCost/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:GoodsCost/cat_pcd:CurrencyName"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div class="title">
						<xsl:text>5. Сведения о транспортных средствах:</xsl:text>
					</div>
					<div class="delim_3"><br/></div>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="16%" align="right"><xsl:text>Ввоз (свободное обращение)</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='1'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="17%" align="right"><xsl:text>Временный ввоз</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='3'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="12%" align="right"><xsl:text>Вывоз</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='2'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="17%" align="right"><xsl:text>Временный вывоз</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[1]/pcd_bd:DirectionMovement='4'"><b>X</b></xsl:if>
									</div>
								</td>
								<td valign="top" width="13%" align="right"><xsl:text>Транзит</xsl:text></td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:if test="pcd_bd:EnterOrExitCustomsTerritory='3'"><b>X</b></xsl:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Транспортные средства, ввозимые с освобождением от уплаты таможенных пошлин, налогов (ввоз со льготой)</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="sign" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansHaveSign"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:choose>
						<xsl:when test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='3' or (substring(cat_ru:TransportKindCode,1,1) != '1' and substring(cat_ru:TransportKindCode,1,1) != '4')]">
							<xsl:for-each select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='3' or (substring(cat_ru:TransportKindCode,1,1) != '1' and substring(cat_ru:TransportKindCode,1,1) != '4')]">
								<xsl:if test="position() != 1"><br/></xsl:if>
								<xsl:call-template name="Auto">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Auto">
								<xsl:with-param name="node" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='3']"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='1']">
							<xsl:for-each select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='1']">
								<xsl:if test="position() != 1"><br/></xsl:if>
								<xsl:call-template name="Aqua">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Aqua">
								<xsl:with-param name="node" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='1']"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='4']">
							<xsl:for-each select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='4']">
								<xsl:if test="position() != 1"><br/></xsl:if>
								<xsl:call-template name="Avia">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Avia">
								<xsl:with-param name="node" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='4']"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<!-- здесь будет про часть товара, пока непонятно откуда брать, но вероятно это будет множественный элемент -->
					<xsl:choose>
						<xsl:when test="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='x']">
							<xsl:for-each select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='x']">
								<xsl:if test="position() != 1"><br/></xsl:if>
								<xsl:call-template name="PartTC">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PartTC">
								<xsl:with-param name="node" select="pcd_bd:TransportMeans/pcd_bd:TransportMeansDetails[substring(cat_ru:TransportKindCode,1,1)='x']"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Мне известно, что сообщение в пассажирской таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с </xsl:text>
									<xsl:text>законодательством государства - члена ЕАЭС.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="pcd_bd:Signer"/>
					<br/>
					<div class="hr-dashed"/>
					<table>
						<tbody>
							<tr>
								<td width="30%" align="left">
									<xsl:text>Для служебных отметок:</xsl:text>
									<div class="delim_3"><br/></div>
								</td>
								<td width="3%"/>
								<td width="67%"/>
							</tr>
							<tr>
								<td align="right" valign="top">
									<div style="width:30mm;height:30mm;border:1px solid;"/>
									<div class="delim_3"><br/></div>
									<div style="width:30mm;text-align: center;"><xsl:text>М.П.</xsl:text></div>
								</td>
								<td/>
								<td valign="top">
									<table style="table-layout: fixed;">
										<tbody>
											<tr>
												<td class="border-bottom" style="word-break: break-all;">
													<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:LNP"/>
													<xsl:if test="not(pcd_bd:CustomsMark/cat_ru:PersonName) and not(pcd_bd:CustomsMark/cat_ru:LNP)"> <br/></xsl:if>
												</td>
											</tr>
											<xsl:choose>
												<xsl:when test="pcd_bd:CustomsMark/cat_pcd:Mark">
													<xsl:for-each select="pcd_bd:CustomsMark/cat_pcd:Mark">
													<tr>
														<td class="border-bottom" style="word-break: break-all;">
															<xsl:value-of select="."/>
														</td>
													</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="border-bottom"> <br/></td>
													</tr>
													<tr>
														<td class="border-bottom"> <br/></td>
													</tr>
													<tr>
														<td class="border-bottom"> <br/></td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="33%"><div class="hr-dashed"/></td>
								<td width="67%"/>
							</tr>
							<tr>
								<td colspan="2">
									<xsl:text>&lt;*&gt; Необходимо заполнить приложение к пассажирской таможенной декларации.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>	
				<xsl:if test="pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign='true' or pcd_bd:MovementCurrencyValuesInfo/pcd_bd:ExcessLimitForeignCurSign='1' or pcd_bd:PCDAdditionalInfo">
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td width="35%"/>
									<td width="65%" align="right"><xsl:text>Приложение к пассажирской таможенной декларации</xsl:text></td>
								</tr>
								<tr>
									<td colspan="2" class="delim_3"> <br/></td>
								</tr>
								<tr>
									<td/>
									<td class="border-bottom" align="center">
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="pcd_bd:DeclarantPerson/cat_pcd:PersonMiddleName"/>
										<br/>
									</td>
								</tr>
								<tr>
									<td/>
									<td class="graph_under">(фамилия, имя, отчество декларанта)</td>
								</tr>
								<tr>
									<td colspan="2" class="delim_3"> <br/></td>
								</tr>
							</tbody>
						</table>
						<div class="title">
							<xsl:text>1. Дополнительные сведения о декларанте:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td width="3%" class="border-bottom">
										<xsl:value-of select="substring(pcd_bd:DeclarantPerson/pcd_bd:BirthDate,9,2)"/>
									</td>
									<td width="1%" align="center" valign="bottom">
										<xsl:text>/</xsl:text>
									</td>
									<td width="3%" class="border-bottom">
										<xsl:value-of select="substring(pcd_bd:DeclarantPerson/pcd_bd:BirthDate,6,2)"/>
									</td>
									<td width="1%" align="center" valign="bottom">
										<xsl:text>/</xsl:text>
									</td>
									<td width="5%" class="border-bottom">
										<xsl:value-of select="substring(pcd_bd:DeclarantPerson/pcd_bd:BirthDate,1,4)"/>
									</td>
									<td width="3%"> <br/></td>
									<td width="84%" class="border-bottom">
										<xsl:for-each select="pcd_bd:DeclarantPerson/pcd_bd:RegDocumentReference/*">
											<xsl:choose>
												<xsl:when test="contains(local-name(.),'Date')">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="."/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="."/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph_under" colspan="5">(дата рождения)</td>
									<td/>
									<td class="graph_under">
										<xsl:text>(номер и дата выдачи визы (реквизиты документа, подтверждающего право иностранного гражданина или </xsl:text>
										<xsl:text>лица без гражданства на пребывание (проживание) на территории государства - члена ЕАЭС)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title">
							<xsl:text>2. Сведения о наличных денежных средствах и (или) денежных инструментах:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<div class="title">
							<xsl:text>2.1. Наличные денежные средства и дорожные чеки:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table class="bordered">
							<tbody>
								<tr>
									<th width="33%" align="center">Наличные денежные средства, дорожные чеки</th>
									<th width="33%" align="center">Сумма</th>
									<th width="33%" align="center">Наименование валюты</th>
								</tr>
								<xsl:variable name="notescoins">
									<xsl:choose>
										<xsl:when test="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='1' or pcd_bd:ForeignCurKind='2']) &gt;= 1">
											<xsl:value-of select="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='1' or pcd_bd:ForeignCurKind='2'])"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td>
										<xsl:attribute name="rowspan"><xsl:value-of select="$notescoins"/></xsl:attribute>
										<xsl:text>Банкноты, казначейские билеты, монеты</xsl:text>
									</td>
									<td>
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][1]/pcd_bd:MoveAmount/cat_pcd:Amount">
											<xsl:value-of select="translate(translate(format-number(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][1]/pcd_bd:MoveAmount/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
										</xsl:if>
									</td>
									<td>
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][1]/pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind) &lt; 3][position() &gt; 1]">
									<tr>
										<td>
											<xsl:if test="pcd_bd:MoveAmount/cat_pcd:Amount">
												<xsl:value-of select="translate(translate(format-number(pcd_bd:MoveAmount/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
											</xsl:if>
										</td>
										<td>
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="checks">
									<xsl:choose>
										<xsl:when test="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3]) &gt;= 1">
											<xsl:value-of select="count(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:ForeignCurKind='3'])"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td>
										<xsl:attribute name="rowspan"><xsl:value-of select="$checks"/></xsl:attribute>
										<xsl:text>Дорожные чеки</xsl:text>
									</td>
									<td>
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][1]/pcd_bd:MoveAmount/cat_pcd:Amount">
											<xsl:value-of select="translate(translate(format-number(pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][1]/pcd_bd:MoveAmount/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][1]/pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[number(pcd_bd:ForeignCurKind)=3][position() &gt; 1]">
									<tr>
										<td>
											<xsl:if test="pcd_bd:MoveAmount/cat_pcd:Amount">
												<xsl:value-of select="translate(translate(format-number(pcd_bd:MoveAmount/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
											</xsl:if>
										</td>
										<td>
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title" style="text-align: justify;">
							<xsl:text>2.2.  Денежные  инструменты,  за  исключением дорожных чеков (векселя, чеки (банковские чеки), ценные бумаги):</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table class="bordered">
							<tbody>
								<tr valign="top" align="center">
									<th>Наименование денежного инструмента</th>
									<th>Наименование эмитента (кем выпущен денежный инструмент)</th>
									<th>Дата выпуска</th>
									<th>Идентифици- рующий номер (при наличии)</th>
									<th>Номинальная стоимость или сумма (в валюте государства - члена ЕАЭС или иностранной валюте), наименование валюты</th>
									<th>Количество (заполняется при отсутствии номинальной стоимости и невозможности определить сумму)</th>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails">
									<tr valign="top">
										<td>
											<xsl:choose>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='0'">вексель</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='1'">банковский чек</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='2'">ценные бумаги на предъявителя</xsl:when>
												<xsl:when test="pcd_bd:MonetaryInstrumentKind='3'">иное</xsl:when>
											</xsl:choose>
										</td>
										<td>
											<xsl:value-of select="pcd_bd:WhoReleased"/>
										</td>
										<td align="center">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="pcd_bd:DateReleased"/>
											</xsl:call-template>
										</td>
										<td class="bordered">
											<xsl:value-of select="pcd_bd:MonetaryInstrumentNumber"/>
										</td>
										<td>
											<xsl:if test="pcd_bd:MoveAmount/cat_pcd:Amount">
												<xsl:value-of select="translate(translate(format-number(pcd_bd:MoveAmount/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:value-of select="pcd_bd:MoveAmount/cat_pcd:CurrencyName"/>
										</td>
										<td align="center">
											<xsl:value-of select="pcd_bd:Quantity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title" style="text-align: justify;">
							<xsl:text>3. Сведения   о  владельце  наличных  денежных  средств  и  (или)  денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<div style="text-align: justify;">
							<xsl:text>(заполняется в случае, если декларант не является собственником)</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table class="bordered">
							<tbody>
								<tr valign="top" align="center">
									<th>
										<xsl:text>Фамилия, имя, отчество (при наличии) физического лица, в том числе индивидуального предпринимателя, зарегистрированного </xsl:text>
										<xsl:text>в соответствии с законодательством государства - члена ЕАЭС, или наименование юридического лица</xsl:text>
									</th>
									<th>
										<xsl:text>Адрес места жительства физического лица, в том числе индивидуального предпринимателя, зарегистрированного в </xsl:text>
										<xsl:text>соответствии с законодательством государства - члена ЕАЭС, или место нахождения юридического лица</xsl:text>
									</th>
									<th>
										<xsl:text>Сумма, номинальная стоимость наличных денежных средств и (или) денежных инструментов, наименование валюты и (или) </xsl:text>
										<xsl:text>количество и наименование денежных инструментов</xsl:text>
									</th>
								</tr>
								<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur|pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails">
									<xsl:for-each select="pcd_bd:OwnerMoney">
										<xsl:if test="pcd_bd:OwnerMoneyKind != '0'">
											<tr valign="top">
												<td>
													<xsl:value-of select="pcd_bd:OwnerMoneyName"/>
												</td>
												<td>
													<xsl:for-each select="pcd_bd:OwnerMoneyAddress/*">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="../pcd_bd:MoveAmount">
														<xsl:if test="cat_pcd:Amount">
															<xsl:value-of select="translate(translate(format-number(cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_pcd:CurrencyCode"/>
													</xsl:for-each>
													<xsl:if test="../pcd_bd:Quantity">
														<xsl:text>, </xsl:text>
														<xsl:value-of select="../pcd_bd:Quantity"/>
														<xsl:text> шт.</xsl:text>
													</xsl:if>
													<xsl:for-each select="../pcd_bd:ForeignCurKind">
														<xsl:choose>
															<xsl:when test=". = '1'"><xsl:text>, банкноты</xsl:text></xsl:when>
															<xsl:when test=". = '2'"><xsl:text>, монеты</xsl:text></xsl:when>
															<xsl:when test=". = '3'"><xsl:text>, дорожные чеки</xsl:text></xsl:when>
														</xsl:choose>
													</xsl:for-each>
													<xsl:for-each select="../pcd_bd:MonetaryInstrumentKind">
														<xsl:choose>
															<xsl:when test=". = '0'"><xsl:text>, вексель</xsl:text></xsl:when>
															<xsl:when test=". = '1'"><xsl:text>, банковский чек</xsl:text></xsl:when>
															<xsl:when test=". = '2'"><xsl:text>, ценные бумаги на предъявителя</xsl:text></xsl:when>
															<xsl:when test=". = '3'"><xsl:text>, </xsl:text><xsl:value-of select="../pcd_bd:MonetaryInstrumentName"/></xsl:when>
														</xsl:choose>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title" style="text-align: justify;">
							<xsl:text>4. Сведения об источнике происхождения наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="20%" align="right"><xsl:text>Заработная плата, доходы от предпринимательской деятельности физического лица</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='1' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='1'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="21%" align="right"><xsl:text>Дивиденды и другие доходы от участия в уставном (акционерном и т.п.) капитале организаций</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='2' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='2'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="18%" align="right"><xsl:text>Доходы от реализации движимого и (или) недвижимого имущества</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='3' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='3'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="21%" align="right"><xsl:text>Безвозмездные трансферты, полученные от физических и (или) юридических лиц (материальная помощь, гранты и т.п.)</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='4' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='4'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8"> <br/></td>
								</tr>
								<tr>
									<td valign="top" align="right"><xsl:text>Пенсия, стипендия, социальные пособия, алименты</xsl:text></td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='5' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='5'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" align="right"><xsl:text>Доходы от аренды недвижимости и земельных участков</xsl:text></td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='6' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='6'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" align="right"><xsl:text>Заемные средства</xsl:text></td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='7' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='7'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" align="right"><xsl:text>Наследство</xsl:text></td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='8' or pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails/pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='8'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8"> <br/></td>
								</tr>
								<tr valign="top">
									<td valign="top" align="left"><xsl:text>Прочее (указать)</xsl:text></td>
									<td colspan="7" class="border-bottom">
										<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RecDetailsForeignCur[pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9']|pcd_bd:PCDAdditionalInfo/pcd_bd:MonetaryInstrumentsDetails[pcd_bd:OriginMoney/pcd_bd:OriginMoneyKind='9']">
											<xsl:value-of select="pcd_bd:OriginMoney/pcd_bd:OriginMoneyOther"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title" style="text-align: justify;">
							<xsl:text>5. Сведения о предполагаемом использовании наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="20%" align="right"><xsl:text>Текущие расходы (приобретение товаров и услуг)</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='1']">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="19%" align="right"><xsl:text>Инвестиции, включая приобретение недвижимости</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='2']">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="22%" align="right"><xsl:text>Безвозмездные трансферты в пользу физических лиц (материальная помощь и т.п.)</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='3']">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="19%" align="right"><xsl:text>Безвозмездные трансферты в пользу юридических лиц (благотворительность, пожертвования и т.п.)</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='4']">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8"> <br/></td>
								</tr>
								<tr valign="top">
									<td colspan="2" valign="top" align="left"><xsl:text>Прочее (указать)</xsl:text></td>
									<td colspan="6" class="border-bottom">
										<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:IntendedUseMoney[pcd_bd:IntendedUseMoneyKind='5']">
											<xsl:value-of select="pcd_bd:IntendedUseMoneyOther"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<div class="title" style="text-align: justify;">
							<xsl:text>6.  Сведения  о  маршруте  и  способе перевозки наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td width="48%" class="border-bottom" align="center">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryDeparture/cat_pcd:CountryName"/>
										<xsl:text>, </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMDateDeparture"/>
										</xsl:call-template>
									</td>
									<td width="4%"> <br/></td>
									<td width="48%" class="border-bottom" align="center">
										<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMCountryArrival/cat_pcd:CountryName"/>
										<xsl:text>, </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:RMDateArrival"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="graph_under">(страна отправления, дата выезда)</td>
									<td/>
									<td class="graph_under">(страна назначения, дата въезда)</td>
								</tr>
								<tr>
									<td colspan="3" class="delim_3"> <br/></td>
								</tr>
								<tr>
									<td colspan="3" class="border-bottom">
										<xsl:for-each select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransitCountries">
											<xsl:value-of select="cat_pcd:CountryName"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="graph_under">(страны транзита)</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td valign="bottom" style="text-align: justify;">
										<xsl:text>Вид транспорта, которым осуществляется ввоз на таможенную территорию ЕАЭС или  вывоз  с  таможенной территории ЕАЭС </xsl:text>
										<xsl:text>наличных денежных средств и (или) денежных инструментов:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3"><br/></div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="17%" align="right"><xsl:text>воздушный</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '40'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="23%" align="right"><xsl:text>автомобильный</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '30'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="25%" align="right"><xsl:text>железнодорожный</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '20'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
									<td valign="top" width="15%" align="right"><xsl:text>водный</xsl:text></td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode = '10'">
												<b>X</b>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8"> <br/></td>
								</tr>
								<tr valign="top">
									<td colspan="2" valign="top" align="left"><xsl:text>Прочее (указать)</xsl:text></td>
									<td colspan="6" class="border-bottom" align="center">
										<xsl:if test="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '10' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '20' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '30' and pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode != '40'">
											<xsl:value-of select="pcd_bd:PCDAdditionalInfo/pcd_bd:RouteMoney/pcd_bd:TransportModeCode"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Мне известно, что сообщение в пассажирской таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с </xsl:text>
										<xsl:text>законодательством государства - члена ЕАЭС.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:apply-templates select="pcd_bd:Signer"/>
						<br/>
						<div class="hr-dashed"/>
						<table>
							<tbody>
								<tr>
									<td width="30%" align="left">
										<xsl:text>Для служебных отметок:</xsl:text>
										<div class="delim_3"><br/></div>
									</td>
									<td width="3%"/>
									<td width="67%"/>
								</tr>
								<tr>
									<td align="right" valign="top">
										<div style="width:30mm;height:30mm;border:1px solid;"/>
										<div class="delim_3"><br/></div>
										<div style="width:30mm;text-align: center;"><xsl:text>М.П.</xsl:text></div>
									</td>
									<td/>
									<td valign="top">
										<table style="table-layout: fixed;">
											<tbody>
												<tr>
													<td class="border-bottom" style="word-break: break-all;">
														<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="pcd_bd:CustomsMark/cat_ru:LNP"/>
														<xsl:if test="not(pcd_bd:CustomsMark/cat_ru:PersonName) and not(pcd_bd:CustomsMark/cat_ru:LNP)"> <br/></xsl:if>
													</td>
												</tr>
												<xsl:choose>
													<xsl:when test="pcd_bd:CustomsMark/cat_pcd:Mark">
														<xsl:for-each select="pcd_bd:CustomsMark/cat_pcd:Mark">
														<tr>
															<td class="border-bottom" style="word-break: break-all;">
																<xsl:value-of select="."/>
															</td>
														</tr>
														</xsl:for-each>
													</xsl:when>
													<xsl:otherwise>
														<tr>
															<td class="border-bottom"> <br/></td>
														</tr>
														<tr>
															<td class="border-bottom"> <br/></td>
														</tr>
														<tr>
															<td class="border-bottom"> <br/></td>
														</tr>
													</xsl:otherwise>
												</xsl:choose>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="Auto">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="35%" align="left">
						<xsl:text>Авто- и мототранспортное средство</xsl:text>
					</td>
					<td width="5%">
						<xsl:variable name="FirstAuto">
							<xsl:choose>
								<xsl:when test="$node">true</xsl:when>
								<xsl:otherwise>false</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="yesno">
							<xsl:with-param name="sign" select="$FirstAuto"/>
						</xsl:call-template>
					</td>
					<td width="15%" align="right">
						<xsl:text>Прицеп</xsl:text>
					</td>
					<td width="5%">
						<xsl:variable name="FirstTrailer">
							<xsl:choose>
								<xsl:when test="$node/cat_ru:ActiveTransportIdentifier">true</xsl:when>
								<xsl:otherwise>false</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="yesno">
							<xsl:with-param name="sign" select="$FirstTrailer"/>
						</xsl:call-template>
					</td>
					<td width="40%"/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table>
			<tbody>
				<tr>
					<td width="30%" class="border-bottom" align="center">
						<xsl:for-each select="$node">
								<xsl:value-of select="cat_ru:TransportMarkCode"/>
								<xsl:if test="pcd_bd:Mark or pcd_bd:TransportKindName or cat_ru:TransportKindCode">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="pcd_bd:Mark"/>
								<xsl:if test="pcd_bd:TransportKindName or cat_ru:TransportKindCode">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="cat_ru:TransportKindCode"/>
								<xsl:if test="pcd_bd:TransportKindName">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="pcd_bd:TransportKindName"/>
						</xsl:for-each>
					</td>
					<td width="2%"> <br/></td>
					<td width="24%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:TransportRegNumber"/>
						<xsl:if test="$node/cat_ru:TransportRegNumber and $node/cat_ru:TransportMeansNationalityCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/cat_ru:TransportMeansNationalityCode"/>
					</td>
					<td width="2%"/>
					<td width="24%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:ActiveTransportIdentifier"/>
						<xsl:if test="not($node/cat_ru:ActiveTransportIdentifier)">
							<xsl:value-of select="$node/cat_ru:TransportIdentifier"/>
						</xsl:if>
					</td>
					<td width="2%"/>
					<td width="16%" class="border-bottom" align="center">
						<xsl:value-of select="$node/pcd_bd:EngineVolumeQuanity"/>
					</td>
				</tr>
				<tr>
					<td class="graph_under">(марка, модель)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(идентификационный номер)</td>
					<td/>
					<td class="graph_under">(рабочий объем двигателя (см3))</td>
				</tr>
				<tr>
					<td colspan="7" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tbody>
				<tr>
					<td width="23%" class="border-bottom" align="center"/>
					<td width="2%"> <br/></td>
					<td width="24%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:VIN"/>
					</td>
					<td width="2%"/>
					<td width="24%" class="border-bottom" align="center">
						<xsl:value-of select="$node/pcd_bd:OfftakeYear"/>
					</td>
					<td width="2%"/>
					<td width="23%" class="border-bottom" align="center">
						<xsl:if test="$node/pcd_bd:CustCost/cat_pcd:Amount">
							<xsl:value-of select="translate(translate(format-number($node/pcd_bd:CustCost/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/pcd_bd:CustCost/cat_pcd:CurrencyCode"/>
					</td>
				</tr>
				<tr>
					<td class="graph_under">(номер кузова)</td>
					<td/>
					<td class="graph_under">(номер шасси)</td>
					<td/>
					<td class="graph_under">(дата изготовления)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
				</tr>
				<tr>
					<td colspan="7" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Aqua">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="17%" align="left" valign="bottom">
						<xsl:text>Водное судно</xsl:text>
					</td>
					<td width="2%"> <br/></td>
					<td width="8%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:TransportKindCode"/>
					</td>
					<td width="2%"/>
					<td width="23%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:TransportRegNumber"/>
						<xsl:if test="not($node/cat_ru:TransportRegNumber)">
							<xsl:value-of select="$node/cat_ru:TransportIdentifier"/>
						</xsl:if>
						<xsl:if test="($node/cat_ru:TransportRegNumber or $node/cat_ru:TransportIdentifier) and $node/cat_ru:TransportMeansNationalityCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/cat_ru:TransportMeansNationalityCode"/>
					</td>
					<td width="2%"/>
					<td width="18%" class="border-bottom" align="center">
						<xsl:if test="$node/pcd_bd:CustCost/cat_pcd:Amount">
							<xsl:value-of select="translate(translate(format-number($node/pcd_bd:CustCost/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/pcd_bd:CustCost/cat_pcd:CurrencyCode"/>
					</td>
					<td width="2%"/>
					<td width="12%" class="border-bottom" align="center"/>
					<td width="2%"/>
					<td width="12%" class="border-bottom" align="center"/>
				</tr>
				<tr>
					<td/>
					<td/>
					<td class="graph_under">(вид)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
					<td/>
					<td class="graph_under">(масса (кг))</td>
					<td/>
					<td class="graph_under">(длина корпуса (м))</td>
				</tr>
				<tr>
					<td colspan="11" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Avia">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="22%" align="left" valign="bottom">
						<xsl:text>Воздушное судно</xsl:text>
					</td>
					<td width="2%"> <br/></td>
					<td width="8%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:TransportKindCode"/>
					</td>
					<td width="2%"/>
					<td width="25%" class="border-bottom" align="center">
						<xsl:value-of select="$node/cat_ru:TransportRegNumber"/>
						<xsl:if test="not($node/cat_ru:TransportRegNumber)">
							<xsl:value-of select="$node/cat_ru:TransportIdentifier"/>
						</xsl:if>
						<xsl:if test="($node/cat_ru:TransportRegNumber or $node/cat_ru:TransportIdentifier) and $node/cat_ru:TransportMeansNationalityCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/cat_ru:TransportMeansNationalityCode"/>
					</td>
					<td width="2%"/>
					<td width="22%" class="border-bottom" align="center">
						<xsl:if test="$node/pcd_bd:CustCost/cat_pcd:Amount">
							<xsl:value-of select="translate(translate(format-number($node/pcd_bd:CustCost/cat_pcd:Amount, '#,###.00'),',',' '),'.',',')"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="$node/pcd_bd:CustCost/cat_pcd:CurrencyCode"/>
					</td>
					<td width="2%"/>
					<td width="15%" class="border-bottom" align="center"/>
				</tr>
				<tr>
					<td/>
					<td/>
					<td class="graph_under">(вид)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
					<td/>
					<td class="graph_under">(масса пустого снаряженного аппарата (кг))</td>
				</tr>
				<tr>
					<td colspan="9" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="PartTC">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td colspan="2" align="left" valign="bottom" style="text-align: justify;">
						<xsl:text>Часть транспортного средства, замененная в государстве, не являющемся </xsl:text>
						<xsl:text>членом ЕАЭС, и подлежащая учету (регистрации)</xsl:text>
					</td>
				</tr>
				<tr>
					<td width="99%" class="border-bottom" align="center">
						<br/>
					</td>
					<td  width="1%" align="right" valign="bottom">
						<xsl:text>.</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="graph_under">(наименование, номер)</td>
					<td/>
				</tr>
				<tr>
					<td colspan="2" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pcd_bd:Signer">
		<table width="100%">
			<tbody>
				<tr>
					<td width="3%" class="border-bottom">
						<xsl:value-of select="substring(cat_pcd:IssueDate,9,2)"/>
					</td>
					<td width="1%" align="center" valign="bottom">
						<xsl:text>/</xsl:text>
					</td>
					<td width="3%" class="border-bottom">
						<xsl:value-of select="substring(cat_pcd:IssueDate,6,2)"/>
					</td>
					<td width="1%" align="center" valign="bottom">
						<xsl:text>/</xsl:text>
					</td>
					<td width="3%" class="border-bottom">
						<xsl:value-of select="substring(cat_pcd:IssueDate,3,2)"/>
					</td>
					<td width="3%"> <br/></td>
					<td width="20%" class="border-bottom"/>
					<td width="3%"/>
					<td width="63%" class="border-bottom">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
						<xsl:if test="cat_pcd:PersonMode">
							<br/>
							<xsl:choose>
								<xsl:when test="cat_pcd:PersonMode='1'">декларант</xsl:when>
								<xsl:when test="cat_pcd:PersonMode='2'">таможенный представитель</xsl:when>
								<xsl:otherwise><xsl:value-of select="cat_pcd:PersonMode"/></xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<xsl:if test="cat_ru:PersonPost">
							<br/>
							<xsl:value-of select="cat_ru:PersonPost"/>
						</xsl:if>
						<xsl:if test="cat_pcd:CustomsRepresCertificate">
							<br/>
							<xsl:for-each select="cat_pcd:CustomsRepresCertificate/*">
								<xsl:choose>
									<xsl:when test="contains(local-name(.), 'Date')">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="."/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="contains(local-name(.), 'Code')">
										<xsl:choose>
											<xsl:when test=".='2'">свидетельство таможенного представителя (брокера)</xsl:when>
											<xsl:when test=".='3'">свидетельство таможенного представителя</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="."/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="position()!=last()">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="cat_pcd:ContractRepresDecl">
							<br/>
							<xsl:for-each select="cat_pcd:ContractRepresDecl/*">
								<xsl:choose>
									<xsl:when test="contains(local-name(.), 'Date')">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="."/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="."/>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="position()!=last()">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="graph_under" colspan="5">(дата)</td>
					<td/>
					<td class="graph_under">(подпись)</td>
					<td/>
					<td class="graph_under">(Ф. И. О. лица, действующего от имени и по поручению декларанта, реквизиты документа)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="yesno">
		<xsl:param name="sign"/>
		<table>
			<tbody>
				<tr>
					<td align="center">
						<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
							<xsl:if test="$sign='1' or $sign='true' or $sign='t'"><b>X</b></xsl:if>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
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
