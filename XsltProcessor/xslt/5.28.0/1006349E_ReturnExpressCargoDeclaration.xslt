<?xml version="1.0" encoding="utf-8"?>
<!-- 
ExpressRegistryKindCode='ДТЭГ' - Решение Коллегии ЕЭК от 28.08.2018 № 142
ExpressRegistryKindCode='ПДТЭГ' - Решение Коллегии ЕЭК от 16.10.2018 № 158 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:recd="urn:customs.ru:Information:CustomsDocuments:ReturnExpressCargoDeclaration:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0">
	<!-- Шаблон для типа ReturnExpressCargoDeclarationType -->
	<xsl:key name="prevDoc" match="recd:PrevApplicationRegNum" use="."/>
	<xsl:template match="recd:ReturnExpressCargoDeclaration">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 10mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
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
                  /*margin-top: 1px;*/
                  margin: 0px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }
                  td.bordered_fat2
                  {
                  border-top: solid 3px windowtext;
                  border-bottom: solid 3px windowtext;
                  border-right: solid 1px windowtext;
                  border-left: solid 1px windowtext;
                  }
                  td.bordered_fat3
                  {
                  border-top: solid 4px windowtext;
                  border-bottom: solid 4px windowtext;
                  border-right: solid 1px windowtext;
                  border-left: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="recd:ExpressRegistryKindCode = 'ДТЭГ'">
						<table cellpadding="4">
							<tbody>
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
								</tr>
								<tr>
									<td colspan="16" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle"><b>Декларация на товары для экспресс-грузов</b></td>
								</tr>
								<tr valign="top">
									<td class="bordered" colspan="4" rowspan="2">Отправитель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="recd:GoodsShipment/recd:ConsignorDetails"/>
									</td>
									<td class="bordered" colspan="3" rowspan="2">Получатель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="recd:GoodsShipment/recd:ConsigneeDetails"/>
									</td>
									<td colspan="5" class="bordered">A</td>
									<td colspan="2" class="bordered">ДТЭГ<br/>
										<xsl:value-of select="recd:ElectronicDocumentSign"/>
									</td>
									<td colspan="2" class="bordered">Особенность<br/>
										<xsl:value-of select="recd:DeclarationKind"/>
									</td>
								</tr>
								<tr valign="top">
									<td colspan="5" class="bordered">Предшествующий документ<br/>
									<xsl:for-each select="recd:GoodsShipment/recd:HouseShipment/recd:PrevApplicationRegNum[generate-id() = generate-id(key('prevDoc', .))]">
										<xsl:if test="position() &gt; 1">, </xsl:if>
										<xsl:apply-templates mode="reg_num" select="."/>
									</xsl:for-each>
									</td>
									<td colspan="2" class="bordered">Кол-во листов <xsl:value-of select="recd:TotalSheetNumber"/>
									</td>
									<td colspan="2" class="bordered">Процедура<br/>
										<xsl:value-of select="recd:CustomsModeCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="recd:PreviousCustomsModeCode"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" colspan="5">Общие сведения</td>
									<td class="bordered" colspan="8">Сведения о товарах</td>
									<td class="bordered" colspan="2">Сведения о документах</td>
									<td class="bordered">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" rowspan="2">N п/п</td>
									<td class="bordered" rowspan="2">Общая накладная</td>
									<td class="bordered" rowspan="2">Инд. накладная</td>
									<td class="bordered" rowspan="2">Инд. отправитель<sup>1</sup></td>
									<td class="bordered" rowspan="2">Инд. получатель<sup>2</sup></td>
									<td class="bordered" rowspan="2">N п/п</td>
									<td class="bordered" rowspan="2">Наименование</td>
									<td class="bordered" rowspan="2">Код ТН ВЭД ЕАЭС</td>
									<td class="bordered" rowspan="2">Кол-во</td>
									<td class="bordered" colspan="2">Вес</td>
									<td class="bordered" rowspan="2">Валюта, стоимость</td>
									<td class="bordered" rowspan="2">Таможенная стоимость</td>
									<td class="bordered" rowspan="2">Код, признак</td>
									<td class="bordered" rowspan="2">Дата, номер</td>
									<td class="bordered" rowspan="3"/>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">брутто</td>
									<td class="bordered">нетто</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7</td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
									<td class="bordered">12</td>
									<td class="bordered">13</td>
									<td class="bordered">14</td>
									<td class="bordered">15</td>
								</tr>
								<xsl:for-each select="recd:GoodsShipment/recd:HouseShipment">
									<xsl:variable name="rowspan" select="count(recd:GoodsItemDetails[not(recd:PresentedDocDetails)])+count(recd:GoodsItemDetails/recd:PresentedDocDetails)"/>
									<tr align="center" valign="top">
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan+1"/></xsl:attribute>
											</xsl:if>
											<xsl:if test="$rowspan &lt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="2"/></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="recd:ObjectOrdinal"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="recd:TransportDocumentDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="recd:HouseWaybillDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="recd:ConsignorDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="recd:ConsigneeDetails"/>
										</td>
										<xsl:if test="not(recd:GoodsItemDetails)">
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
										</xsl:if>
										<xsl:apply-templates select="recd:GoodsItemDetails[1]" mode="dt"/>
									</tr>
									<xsl:for-each select="recd:GoodsItemDetails[position() = 1]">
										<xsl:for-each select="recd:PresentedDocDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="."/>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="recd:GoodsItemDetails[position() &gt; 1]">
										<tr align="center" valign="top">
											<xsl:apply-templates select="." mode="dt"/>
										</tr>
										<xsl:for-each select="recd:PresentedDocDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="."/>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat2" colspan="8" align="left">
											Всего по индивидуальной накладной<br/>(общий вес брутто, таможенная стоимость)
										</td>
										<td class="bordered_fat2">
											<xsl:apply-templates mode="quantity" select="recd:UnifiedGrossWeightQuantity"/>
										</td>
										<td  class="bordered_fat2" colspan="2"/>
										<td class="bordered_fat2">
											<xsl:apply-templates mode="pricevalue" select="recd:CustomsCost"/>
										</td>
										<td  class="bordered_fat2" colspan="3"/>
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered_fat3" colspan="9" align="left">
											Всего по декларации на товары для экспресс-грузов<br/>(общий вес брутто, таможенная стоимость)
										</td>
									<td class="bordered_fat3">
										<xsl:apply-templates mode="quantity" select="recd:GoodsShipment/recd:UnifiedGrossWeightQuantity"/>
									</td>
									<td class="bordered_fat3" colspan="2"/>
									<td class="bordered_fat3">
										<xsl:apply-templates mode="pricevalue" select="recd:GoodsShipment/recd:CustomsCost"/>
									</td>
									<td class="bordered_fat3" colspan="3"/>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table cellpadding="4">
							<tbody>
								<xsl:variable name="cnt_GoodsItemDetails" select="count(recd:GoodsShipment/recd:HouseShipment/recd:GoodsItemDetails/recd:CustomsPaymentDetails)+count(recd:GoodsShipment/recd:HouseShipment)+4"/>
								<xsl:variable name="row_part1" select="number($cnt_GoodsItemDetails)-number(2)"/>
								<tr align="center" valign="top">
									<td class="bordered" colspan="6">B. Исчисление платежей</td>
									<td class="bordered" align="left" rowspan="{$row_part1}">Сведения о лице, заполнившем ДТЭГ, дата
										<br/><br/>
										<xsl:value-of select="recd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonMiddleName"/>
										<br/>
										<xsl:apply-templates mode="identitycard" select="recd:SignatoryPerson/recd:SignatoryPersonIdentityDetails"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonPost"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">Товар</td>
									<td class="bordered">Вид</td>
									<td class="bordered">База для исчисления</td>
									<td class="bordered">Код базы для исчисления</td>
									<td class="bordered">Ставка</td>
									<td class="bordered">Сумма</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
								</tr>
								<xsl:for-each select="recd:GoodsShipment/recd:HouseShipment">
									<xsl:variable name="party" select="."/>
									<xsl:for-each select="recd:GoodsItemDetails">
										<xsl:variable name="partyDetails" select="."/>
										<xsl:variable name="cnt_CustomsPaymentDetails" select="count(recd:CustomsPaymentDetails)"/>
										<xsl:for-each select="recd:CustomsPaymentDetails">
											<tr align="center">
												<xsl:if test="position()=1">
													<td class="bordered" rowspan="{$cnt_CustomsPaymentDetails}">
														<xsl:value-of select="$party/recd:ObjectOrdinal"/>
														<xsl:text>/</xsl:text>
														<xsl:value-of select="$partyDetails/recd:GoodsNumeric"/>
													</td>
												</xsl:if>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:PaymentModeCode"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:TaxBase"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:TaxBaseCurrencyCode"/>
												</td>
												<td class="bordered">
													<xsl:apply-templates mode="rate1" select="."/>
												</td>
												<td class="bordered">
													<xsl:value-of select="RUDECLcat:PaymentAmount"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat2">
											Всего по индивидуальной накладной
										</td>
										<td class="bordered_fat2"/>
										<td class="bordered_fat2"/>
										<td class="bordered_fat2"/>
										<td class="bordered_fat2"/>
										<td class="bordered_fat2">
											<xsl:value-of select="recd:CustomsPaymentDetails/RUDECLcat:PaymentAmount"/>
										</td>
										<xsl:if test="position()=last()">
											<td class="bordered" align="left" rowspan="2">C</td>
										</xsl:if>	
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered_fat3">
										Всего по декларации на товары для экспресс-грузов
									</td>
									<td class="bordered_fat3"/>
									<td class="bordered_fat3"/>
									<td class="bordered_fat3"/>
									<td class="bordered_fat3"/>
									<td class="bordered_fat3">
										<xsl:value-of select="recd:GoodsShipment/recd:TotalPaymentAmountDetails/RUScat_ru:Amount"/>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="6">
										<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
										<br/>
										<xsl:for-each select="recd:GoodsShipment/recd:FactCustomsPayment">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
											<xsl:text> - </xsl:text>
											<xsl:value-of select="catESAD_cu:PaymentAmount"/>
											<xsl:text> - </xsl:text>
											<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
											<xsl:text> - </xsl:text>
											<xsl:choose>
												<xsl:when test="recd:PaymentDocument/cat_ru:PrDocumentNumber">
													<xsl:value-of select="recd:PaymentDocument/cat_ru:PrDocumentNumber"/>
												</xsl:when>
												<xsl:otherwise>00</xsl:otherwise>
											</xsl:choose>
											<xsl:text> - </xsl:text>
											<xsl:choose>
												<xsl:when test="recd:PaymentDocument/cat_ru:PrDocumentDate">
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="recd:PaymentDocument/cat_ru:PrDocumentDate"/></xsl:call-template>
												</xsl:when>
												<xsl:otherwise>00</xsl:otherwise>
											</xsl:choose>
											<xsl:text> - </xsl:text>
											<xsl:value-of select="recd:PaymentWayCode"/>
											<xsl:if test="recd:RFOrganizationFeatures/cat_ru:INN">
												<xsl:text> - </xsl:text>
												<xsl:value-of select="recd:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" align="left" rowspan="3" valign="top">D</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="recd:ExpressRegistryKindCode = 'ПТДЭГ'">
						<table cellpadding="4">
							<tbody>
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
								</tr>
								<tr>
									<td colspan="17" style="border-top:1px solid black;border-left:1px solid black; border-right:1px solid black;" align="center" valign="middle"><b>Пассажирская таможенная декларация для экспресс-грузов</b></td>
								</tr>
								<tr valign="top">
									<td class="bordered" colspan="5" rowspan="3">Отправитель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="recd:GoodsShipment/recd:ConsignorDetails"/>
									</td>
									<td class="bordered" colspan="5" rowspan="3">Получатель (по общей накладной)<br/>
										<xsl:apply-templates mode="org" select="recd:GoodsShipment/recd:ConsigneeDetails"/>
									</td>
									<td class="bordered" colspan="4" rowspan="2">A</td>
									<td class="bordered" colspan="2">ПТДЭГ</td>
									<td class="bordered" rowspan="2">Особенность<br/>
										<xsl:value-of select="recd:DeclarationKind"/>
									</td>
								</tr>
								<tr>
									<td style="border-right: 1px solid black;">
										<xsl:value-of select="recd:DeclarationKindCode"/>
									</td>
									<td>
										<xsl:value-of select="recd:ElectronicDocumentSign"/>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" colspan="4">Предшествующий&#160;документ<br/>
										<xsl:for-each select="recd:GoodsShipment/recd:HouseShipment/recd:PrevApplicationRegNum[generate-id() = generate-id(key('prevDoc', .))]">
											<xsl:if test="position() &gt; 1">, </xsl:if>
											<xsl:apply-templates mode="reg_num" select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered" colspan="3">Кол-во листов <xsl:value-of select="recd:TotalSheetNumber"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" colspan="5">Общие сведения</td>
									<td class="bordered" colspan="7">Сведения о товарах</td>
									<td class="bordered" colspan="2">Сведения о документах</td>
									<td class="bordered" colspan="3" rowspan="3">Примечание</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">N п/п</td>
									<td class="bordered">Общая накладная</td>
									<td class="bordered">Инд. накладная</td>
									<td class="bordered">Инд. отправитель<sup>1</sup></td>
									<td class="bordered">Инд. получатель<sup>2</sup></td>
									<td class="bordered">N п/п</td>
									<td class="bordered">Наименование</td>
									<td class="bordered">Код ТН ВЭД ЕАЭС</td>
									<td class="bordered">Кол-во</td>
									<td class="bordered">Вес брутто</td>
									<td class="bordered">Валюта, стоимость</td>
									<td class="bordered">Валюта, стоимость в валюте государства-члена</td>
									<td class="bordered">Код, признак</td>
									<td class="bordered">Дата, номер</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<td class="bordered">6</td>
									<td class="bordered">7</td>
									<td class="bordered">8</td>
									<td class="bordered">9</td>
									<td class="bordered">10</td>
									<td class="bordered">11</td>
									<td class="bordered">12</td>
									<td class="bordered">13</td>
									<td class="bordered">14</td>
								</tr>
								<xsl:for-each select="recd:GoodsShipment/recd:HouseShipment">
									<xsl:variable name="rowspan_p" select="count(recd:GoodsItemDetails[not(recd:PresentedDocDetails)])+count(recd:GoodsItemDetails/recd:PresentedDocDetails)"/>
									<tr align="center" valign="top">
										<td class="bordered">
											<xsl:if test="$rowspan_p &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p+1"/></xsl:attribute>
											</xsl:if>
											<xsl:if test="$rowspan_p &lt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="2"/></xsl:attribute>
											</xsl:if>
											<xsl:value-of select="recd:ObjectOrdinal"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan_p &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="recd:TransportDocumentDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan_p &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="doc" select="recd:HouseWaybillDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan_p &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="recd:ConsignorDetails"/>
										</td>
										<td class="bordered">
											<xsl:if test="$rowspan_p &gt; 1">
												<xsl:attribute name="rowspan"><xsl:value-of select="$rowspan_p"/></xsl:attribute>
											</xsl:if>
											<xsl:apply-templates mode="org" select="recd:ConsigneeDetails"/>
										</td>
										<xsl:if test="not(recd:GoodsItemDetails)">
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
											<td class="bordered"/>
										</xsl:if>
										<xsl:apply-templates select="recd:GoodsItemDetails[1]" mode="ptd"/>
									</tr>
									<xsl:for-each select="recd:GoodsItemDetails[position() = 1]">
										<xsl:for-each select="recd:PresentedDocDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="."/>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="recd:GoodsItemDetails[position() &gt; 1]">
										<tr align="center" valign="top">
											<xsl:apply-templates select="." mode="ptd"/>
										</tr>
										<xsl:for-each select="recd:PresentedDocDetails[position() &gt; 1]">
											<tr align="center" valign="top">
												<xsl:apply-templates select="."/>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<tr align="center" valign="top">
										<td class="bordered_fat2" colspan="8" align="left">
											Всего по индивидуальной накладной<br/>(общий вес брутто, стоимость в валюте государства-члена)
										</td>
										<td class="bordered_fat2">
											<xsl:apply-templates mode="quantity" select="recd:UnifiedGrossWeightQuantity"/>
										</td>
										<td  class="bordered_fat2"/>
										<td class="bordered_fat2">
											<xsl:apply-templates mode="pricevalue" select="recd:CustomsCost"/>
										</td>
										<td  class="bordered_fat2" colspan="5"/>
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered_fat3" colspan="9" align="left">
											Всего по пассажирской таможенной декларации для экспресс-грузов<br/>(общий вес брутто, стоимость в валюте государства-члена)
										</td>
									<td class="bordered_fat3">
										<xsl:apply-templates mode="quantity" select="recd:GoodsShipment/recd:UnifiedGrossWeightQuantity"/>
									</td>
									<td class="bordered_fat3"/>
									<td class="bordered_fat3">
										<xsl:apply-templates mode="pricevalue" select="recd:GoodsShipment/recd:CustomsCost"/>
									</td>
									<td class="bordered_fat3" colspan="5"/>
								</tr>
								<tr>
									<td colspan="17"><br/> </td>
								</tr>
								<tr>
									<td class="bordered" colspan="17">Сведения о лице, заполнившем ПТДЭГ, дата
										<br/><br/>
										<xsl:value-of select="recd:BrokerRegistryDocDetails/RUDECLcat:DocKindCode"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonMiddleName"/>
										<br/>
										<xsl:apply-templates mode="identitycard" select="recd:SignatoryPerson/recd:SignatoryPersonIdentityDetails"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:SigningDetails/cat_ru:PersonPost"/>
										<br/>
										<xsl:value-of select="recd:SignatoryPerson/recd:PowerOfAttorneyDetails/catESAD_cu:DocKindCode"/>
										<br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="recd:SignatoryPerson/recd:SigningDetails/RUScat_ru:SigningDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="bordered" colspan="17" valign="top">C<br/> </td>
								</tr>
								<tr>
									<td class="bordered" colspan="17" valign="top">D<br/> </td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<table cellpadding="4" width="100%">
						<tr>
							<td width="1%"><sup>1</sup></td>
							<td width="99%">Декларант при вывозе товаров с таможенной территории Евразийского экономического союза.</td>
						</tr>
						<tr>
							<td><sup>2</sup></td>
							<td>Декларант при ввозе товаров на таможенную территорию Евразийского экономического союза.</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="identitycard" match="*">
		<xsl:value-of select="RUScat_ru:CountryCode"/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">серия <xsl:value-of select="RUScat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">№ <xsl:value-of select="RUScat_ru:IdentityCardNumber"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate!=''">
					<xsl:value-of select="RUDECLcat:Rate"/>
				</xsl:when>
				<xsl:otherwise> 0 </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='*' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="reg_num">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template match="recd:GoodsItemDetails" mode="dt">
		<xsl:variable name="rowspandoc" select="count(recd:PresentedDocDetails)"/>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:value-of select="recd:GoodsNumeric"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="recd:GoodsDescription"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:value-of select="recd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="recd:SupplementaryQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="recd:GrossWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="recd:NetWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="recd:CAValueAmount[1]"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="recd:CustomsCost"/>
		</td>
		<xsl:if test="not(recd:PresentedDocDetails)">
			<td class="bordered"/>
			<td class="bordered"/>
		</xsl:if>
		<xsl:apply-templates select="recd:PresentedDocDetails[1]"/>
		<td class="bordered" align="left">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="recd:Note"/>
		</td>
	</xsl:template>

	<xsl:template match="recd:GoodsItemDetails" mode="ptd">
		<xsl:variable name="rowspandoc" select="count(recd:PresentedDocDetails)"/>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:value-of select="recd:GoodsNumeric"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="recd:GoodsDescription"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:value-of select="recd:GoodsTNVEDCode"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="recd:SupplementaryQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="quantity" select="recd:GrossWeightQuantity"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="recd:CAValueAmount[1]"/>
		</td>
		<td class="bordered">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates mode="pricevalue" select="recd:CAValueAmount[2]"/>
		</td>
		<xsl:if test="not(recd:PresentedDocDetails)">
			<td class="bordered"/>
			<td class="bordered"/>
		</xsl:if>
		<xsl:apply-templates select="recd:PresentedDocDetails[1]"/>
		<td class="bordered" colspan="3" align="left">
			<xsl:if test="$rowspandoc &gt; 1">
				<xsl:attribute name="rowspan"><xsl:value-of select="$rowspandoc"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="recd:Note"/>
		</td>
	</xsl:template>

	<xsl:template match="recd:PresentedDocDetails">
		<td class="bordered">
			<xsl:value-of select="RUDECLcat:DocKindCode"/>
			<xsl:if test="recd:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="recd:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode"/>
			</xsl:if>
		</td>
		<td class="bordered">
			<xsl:if test="cat_ru:PrDocumentNumber">
				<xsl:text>№ </xsl:text>
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
				<br/>
			</xsl:if>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</td>
	</xsl:template>

	<xsl:template match="*" mode="pricevalue">
		<xsl:value-of select="recd:CurrencyQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:if test="recd:CurrencyCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="recd:CurrencyCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<!--xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<!--xsl:value-of select="cat_ru:PrDocumentName"/-->
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
		<xsl:if test="recd:DocKindCode">
			<xsl:text> </xsl:text>
			<xsl:value-of select="recd:DocKindCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
