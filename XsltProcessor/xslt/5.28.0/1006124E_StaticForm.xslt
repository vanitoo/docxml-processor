<?xml version="1.0" encoding="UTF-8"?>
<!--Постановление Правительства РФ от 19.06.2020 № 891 -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:statf="urn:customs.ru:Information:CustomsDocuments:StaticForm:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="//*[local-name()='StaticForm']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:for-each select="$node/ancestor-or-self::*">
			<xsl:if test="position()!=1">/</xsl:if>
			<xsl:value-of select="concat(name(),'[',count(preceding-sibling::*[name()=name(current())]),']')"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="statf:StaticForm">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Статическая форма учета перемещения товаров</title>
				<style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 180mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}

						table {
						width: 100%;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
						table-layout: fixed;
						word-wrap:break-word;
						word-break: break-word; 
						}

					.bordered {
						border: solid 1pt #000000;
						}
						

					.border_vertical
					{
					border-right: 1px solid black;
					border-left: 1px solid black;
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
					td {
						font-family:Arial;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
	
					.value {
						font-style: italic;
						font-family: Arial;
						font-size: 8pt;
						}		

						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						text-align: center;
						text-valign: top;
						}
						                 
                </style>
			</head>
			<body>
				<div class="page">
					<table width="100%" class="graph">
						<tbody>
							<tr>
								<td width="3%"/>
								<td width="11%"/>
								<td width="5%"/>
								<td width="16%"/>
								<td width="13%"/>
								<td width="14%"/>
								<td width="5%"/>
								<td width="5%"/>
								<td width="3%"/>
								<td width="20%"/>
								<td width="5%"/>
							</tr>
							<tr>
								<td colspan="11"/>
							</tr>
							<tr>
								<td align="center" class="graphMain" colspan="11">
									<font size="4">
										<b>СТАТИСТИЧЕСКАЯ ФОРМА<br/>учета перемещения товаров<br/>
											<br/>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" valign="top" colspan="4">
									<span class="graphMain">Регистрационный номер</span>
									<br/>
								</td>
								<td class="graph bordered" colspan="3" valign="top">
									<span class="graphMain">Номер аннулируемой ститистической формы</span>
								</td>
								<td colspan="4" class="graph bordered" valign="top">
									<span class="graphMain">Системный номер</span>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" valign="top" colspan="4">
									<xsl:apply-templates select="statf:RegNum"/>
								</td>
								<td class="bordered value" colspan="3" valign="top">
									<xsl:apply-templates select="statf:PreviousRegNumberDoc"/>
								</td>
								<td colspan="4" class="bordered value" valign="top">
									<xsl:apply-templates select="statf:NSF"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="left" class="border_vertical" valign="top">
									<span class="graphMain">1. Продавец </span>
								</td>
								<td colspan="3" class="border_vertical" align="left" valign="top">
									<span class="graphMain">4. Направление перемещения</span>
								</td>
								<td colspan="4" valign="top" class="graph bordered">
									<span class="graphMain">7. Код валюты и общая стоимость товаров</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="border_vertical" align="left" valign="top">
									<span class="value">
										<xsl:apply-templates select="statf:Consignor" mode="org"/>
										<xsl:if test="statf:Sender">
											<br/>
											<xsl:text>Отправитель: </xsl:text>
											<xsl:apply-templates select="statf:Sender" mode="org"/>
										</xsl:if>
									</span>
								</td>
								<td colspan="3" class="border_vertical" valign="top">
									<span class="value">
										<xsl:apply-templates select="statf:CustomsProcedure"/>
									</span>
								</td>
								<td class="bordered value" valign="top">
									<xsl:apply-templates select="statf:CustCostCurrencyCode"/>
								</td>
								<td class="bordered value" colspan="3" valign="top">
									<xsl:apply-templates select="statf:CustCostTotalAmount"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="left" style="border-top: 1px solid black" class="border_vertical">
									<span class="graphMain">2. Покупатель </span>
								</td>
								<td colspan="3" class="graph bordered" valign="top" align="left">
									<span class="graphMain">5. Торгующая страна</span>
								</td>
								<td colspan="4" class="graph bordered" valign="top" align="left">
									<span class="graphMain">8. Страна отправления</span>
								</td>
							</tr>
							<tr>
								<td colspan="4" rowspan="3" class="border_vertical" valign="top" align="left">
									<span class="value">
										<xsl:apply-templates select="statf:Consignee" mode="org"/>
										<xsl:if test="statf:Recipient">
											<br/>
											<xsl:text>Получатель: </xsl:text>
											<xsl:apply-templates select="statf:Recipient" mode="org"/>
										</xsl:if>
									</span>
								</td>
								<td class="graph bordered" valign="top" colspan="2">
									<xsl:apply-templates select="statf:TradeCountry/statf:CountryName"/>
								</td>
								<td class="graph bordered" valign="top">
									<xsl:apply-templates select="statf:TradeCountry/statf:CountryCode"/>
								</td>
								<td class="graph bordered" valign="top" colspan="3">
									<xsl:apply-templates select="statf:DispatchCountry/statf:CountryName"/>
								</td>
								<td class="graph bordered" valign="top">
									<xsl:apply-templates select="statf:DispatchCountry/statf:CountryCode"/>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" align="left" valign="top" colspan="3">
									<span class="graphMain">6. Страна назначения</span>
								</td>
								<td class="graph bordered" align="left" colspan="4" valign="top">
									<span class="graphMain">9. Вид транспорта на границе</span>
								</td>
							</tr>
							<tr>
								<td class="bordered value" valign="top" colspan="2">
									<xsl:apply-templates select="statf:DestinationCountry/statf:CountryName"/>
								</td>
								<td class="bordered value" valign="top">
									<xsl:apply-templates select="statf:DestinationCountry/statf:CountryCode"/>
								</td>
								<td class="bordered value" colspan="3" valign="top">
									<xsl:apply-templates select="statf:TransportName"/>
								</td>
								<td class="bordered value" valign="top">
									<xsl:apply-templates select="statf:TransportModeCode"/>
								</td>
							</tr>
							<tr>
								<td class="graph bordered" valign="top" colspan="4">
									<span class="graphMain">3. Лицо, ответственное за финансовое урегулирование</span>
								</td>
								<td align="left" class="bordered value" valign="top" colspan="7">
									<xsl:apply-templates select="statf:FinancialAdjustingResponsiblePerson" mode="org"/>
								</td>
							</tr>
							<tr>
								<td class="graphMain" align="left" colspan="4" style="border-left: 1px solid black;">
									<xsl:text>10. Документы </xsl:text>
								</td>
								<td align="left" class="value" colspan="7" style="border-right: 1px solid black;">
									<xsl:for-each select="statf:Documents">
										<xsl:apply-templates select="." mode="docBase"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<xsl:for-each select="statf:GoodsInfo">
								<tr>
									<td class="graph bordered" align="left" colspan="3">
										<span class="graphMain">11. Код товара</span>
									</td>
									<td colspan="2" align="left" class="graph bordered">
										<span class="graphMain"> 12. Описание товара </span>
									</td>
									<td colspan="4" align="left" class="graph bordered">
										<span class="graphMain">
											<xsl:text>13. Стоимость товара </xsl:text>
										</span>
									</td>
									<td colspan="2" align="left" class="graph bordered">
										<span class="graphMain">
											<xsl:text>14. Статистическая стоимость(в долларах США)</xsl:text>
										</span>
									</td>
								</tr>
								<tr>
									<td class="bordered value" valign="top">
										<xsl:apply-templates select="statf:GoodsNumeric"/>
									</td>
									<td class="bordered value" valign="top" colspan="2">
										<xsl:apply-templates select="statf:GoodsTNVEDCode"/>
									</td>
									<td align="left" colspan="2" valign="top" class="bordered value">
										<xsl:for-each select="statf:GoodsDescription">
											<xsl:apply-templates select="."/>
											<xsl:if test="following-sibling::statf:GoodsDescription">
												<br/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="statf:AdditionalInformation">
											<xsl:text> </xsl:text>
											<xsl:for-each select="statf:AdditionalInformation">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="statf:Manufacturer">
											<br/>
											<xsl:text>Производитель: </xsl:text>
											<xsl:apply-templates select="statf:Manufacturer" mode="manufacturer"/>
										</xsl:if>
										<xsl:if test="statf:GoodsTraceabilityMeasureDetails">
											<br/>
											<xsl:apply-templates mode="GoodsTraceabilityMeasureDetails" select="statf:GoodsTraceabilityMeasureDetails"/>
										</xsl:if>
										<xsl:if test="statf:DTIdentificationMeansDetails">
											<br/>
											<xsl:text>Коды идентификации: </xsl:text>
											<xsl:for-each select="statf:DTIdentificationMeansDetails">
												<xsl:apply-templates mode="DTIdentificationMeansDetails" select="."/>
											</xsl:for-each>
										</xsl:if>
									</td>
									<td colspan="4" valign="top" class="bordered value">
										<xsl:apply-templates select="statf:InvoicedCost"/>
									</td>
									<td colspan="2" valign="top" class="bordered value">
										<xsl:apply-templates select="statf:StatisticalCostUSD"/>
									</td>
								</tr>
								<tr>
									<td align="left" class="graph bordered" colspan="3">
										<span class="graphMain">15. Страна происхождения</span>
									</td>
									<td colspan="2" align="left" class="graph bordered">
										<span class="graphMain">16. Вес нетто (кг)</span>
									</td>
									<td colspan="4" align="left" class="graph bordered">
										<span class="graphMain">17. Статистическая стоимость(в рублях)</span>
									</td>
									<td colspan="2" align="left" class="graph bordered">
										<span class="graphMain">
											<xsl:text>18. Дополнительные единицы</xsl:text>
										</span>
									</td>
								</tr>
								<tr>
									<td class="bordered value" valign="top" colspan="2">
										<xsl:apply-templates select="statf:OriginCountry/statf:CountryName"/>
									</td>
									<td class="bordered value" valign="top">
										<xsl:apply-templates select="statf:OriginCountry/statf:CountryCode"/>
									</td>
									<td colspan="2" valign="top" class="bordered value">
										<xsl:apply-templates select="statf:NetWeightQuantity"/>
									</td>
									<td colspan="4" valign="top" class="bordered value">
										<xsl:apply-templates select="statf:StatisticalCostRUB"/>
									</td>
									<td valign="top" class="bordered value">
										<xsl:apply-templates select="statf:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
									</td>
									<td valign="top" class="bordered value">
										<xsl:apply-templates select="statf:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
									</td>
								</tr>
								<tr>
									<td class="graph bordered" align="left" colspan="5">
										<span class="graphMain"> 19. Дополнительные сведения </span>
									</td>
									<td class="graph bordered" align="left" colspan="6" valign="top">
										<span class="graphMain">20. Декларация на товары</span>
									</td>
								</tr>
								<tr>
									<td class="bordered value" valign="top" colspan="5">
										<xsl:for-each select="statf:AdditionalInformationCode">
											<br/>
											<xsl:choose>
												<xsl:when test=".='01'">переработка на территории Российской Федерации</xsl:when>
												<xsl:when test=".='02'">переработка вне территории Российской Федерации</xsl:when>
												<xsl:when test=".='03'">продукты переработки</xsl:when>
												<xsl:when test=".='04'">товары, перемещаемые по договору финансовой аренды (лизинга)</xsl:when>
												<xsl:when test=".='05'">переработка для внутреннего потребеления в Россикской Федерации</xsl:when>
												<xsl:when test=".='06'">товары, срок временного ввоза (вывоза) которых был продлен и составил более 1года</xsl:when>
												<xsl:when test=".='07'">товары, вывозиме в рамках интернет-торговли в адрес физических лиц</xsl:when>
												<xsl:when test=".='08'">товары, подлежащие прослеживаемости</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="."/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</td>
									<td class="bordered value" colspan="5">
										<xsl:for-each select="statf:DTInfo">
											<br/>
											<xsl:apply-templates select="statf:DTNumber"/>
										</xsl:for-each>
									</td>
									<td class="bordered value">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:for-each select="statf:DTInfo">
											<br/>
											<xsl:apply-templates select="statf:GoodsNumeric"/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="11">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="11">
									<table width="100%" class="graph ">
										<tbody>
											<tr>
												<td width="21%"/>
												<td width="5%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="4%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="5%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="17%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="4%"/>
												<td width="4%"/>
												<td width="3%"/>
												<td width="3%"/>
												<td width="3%"/>
											</tr>
											<tr>
												<xsl:variable name="execDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="statf:ProvidePerson/RUScat_ru:SigningDate"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="xpath_execDate">
													<xsl:call-template name="get_xpath">
														<xsl:with-param name="node" select="statf:ProvidePerson/RUScat_ru:SigningDate"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:variable name="xpath_ReportingDate">
													<xsl:call-template name="get_xpath">
														<xsl:with-param name="node" select="statf:ReportingDate"/>
													</xsl:call-template>
												</xsl:variable>
												<td align="center" class="graph bordered">Дата заполнения документа</td>
												<td/>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,1,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,2,1)"/>
													</element>
												</td>
												<td/>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,4,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,5,1)"/>
													</element>
												</td>
												<td/>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,7,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,8,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,9,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_execDate}">
														<xsl:value-of select="substring($execDate,10,1)"/>
													</element>
												</td>
												<td/>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,6,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,7,1)"/>
													</element>
												</td>
												<td/>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,1,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,2,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,3,1)"/>
													</element>
												</td>
												<td align="center" class="bordered">
													<element xml_node="{$xpath_ReportingDate}">
														<xsl:value-of select="substring(statf:ReportingDate,4,1)"/>
													</element>
												</td>
											</tr>
											<tr>
												<td/>
												<td/>
												<td class="graphLittle" colspan="2">(число)</td>
												<td/>
												<td colspan="2" class="graphLittle">(месяц)</td>
												<td/>
												<td colspan="4" class="graphLittle">(год)</td>
												<td/>
												<td colspan="2" class="graphLittle">(месяц)</td>
												<td/>
												<td class="graphLittle" colspan="4">(год)</td>
											</tr>
											<tr>
												<td colspan="13"/>
												<td align="left" colspan="7">Отчетный период</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="11">
									<table width="100%" class="graph ">
										<tbody>
											<tr>
												<td width="21%">
													<br/>
													<br/>
												</td>
												<td width="9%"/>
												<td width="20%"/>
												<td width="5%"/>
												<td width="20%"/>
												<td width="5%"/>
												<td width="20%"/>
											</tr>
											<tr>
												<td>Заявитель</td>
												<td/>
												<td class="value underlined" valign="bottom">
													<xsl:apply-templates select="statf:ProvidePerson/cat_ru:PersonPost"/>
												</td>
												<td/>
												<td class="value underlined">
													<xsl:apply-templates select="statf:ProvidePerson/cat_ru:PersonSurname"/> 
									<xsl:apply-templates select="statf:ProvidePerson/cat_ru:PersonName"/> 
									<xsl:apply-templates select="statf:ProvidePerson/cat_ru:PersonMiddleName"/>
												</td>
												<td/>
												<td class="value underlined"/>
											</tr>
											<tr>
												<td/>
												<td/>
												<td class="graphLittle">
													<xsl:text>(должность)
								</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(Ф.И.О)
								</xsl:text>
												</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(подпись)
								</xsl:text>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td/>
												<td class="value underlined">
													<xsl:if test="statf:ProvidePerson/RUScat_ru:CommunicationDetails/cat_ru:Phone">
														<xsl:text>Тел: </xsl:text>
														<xsl:for-each select="statf:ProvidePerson/RUScat_ru:CommunicationDetails/cat_ru:Phone">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:if>
													<xsl:for-each select="statf:ProvidePerson/RUScat_ru:CommunicationDetails/cat_ru:Fax">
														<br/>
														<xsl:text>Факс: </xsl:text>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<xsl:for-each select="statf:ProvidePerson/RUScat_ru:CommunicationDetails/cat_ru:Telex">
														<br/>
														<xsl:text>Телекс:</xsl:text>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</td>
												<td/>
												<td valign="bottom" class="value underlined">
													<xsl:for-each select="statf:ProvidePerson/RUScat_ru:CommunicationDetails/cat_ru:E_mail">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td/>
												<td class="value underlined"/>
											</tr>
											<tr>
												<td/>
												<td/>
												<td class="graphLittle">
													<xsl:text>(номер контактного телефона, факса, телетайпа)</xsl:text>
												</td>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(адрес электронной почты)</xsl:text>
												</td>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(место для печати)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="7">
													<br/>
												</td>
											</tr>
											<tr>
												<td/>
												<td/>
												<td colspan="2" valign="bottom" class="value underlined">
													<xsl:apply-templates select="statf:ProvidePerson/statf:Organization" mode="orgName"/>
												</td>
												<td/>
												<td colspan="2" valign="bottom" class="value underlined">
													<xsl:apply-templates select="statf:ProvidePerson/statf:Organization" mode="orgFeatures"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td/>
												<td colspan="2" class="graphLittle">
													<xsl:text>(полное и сокращенное наименование организации)
								</xsl:text>
												</td>
												<td/>
												<td colspan="2" valign="top" class="graphLittle">
													<xsl:text>(ИНН, КПП ОГРН организацции)
								</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="7">
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td colspan="5" class="value underlined">
													<xsl:for-each select="statf:ProvidePerson/statf:Organization/RUScat_ru:SubjectAddressDetails">
														<xsl:apply-templates mode="ru_address" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td colspan="2"/>
												<td colspan="5" valign="top" class="graphLittle">
													<xsl:text>(почтовый и юридический адрес, местонахождение организации)
								</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="russian_date2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date2">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date2">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn2,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="docBase">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PrDocumentNumber"> №
									<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate"> от
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
			<!--<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>-->
		</xsl:if>
	</xsl:template>
	<xsl:template match="statf:DTNumber|statf:RegNum">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<!--<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>-->
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template mode="DTIdentificationMeansDetails" match="*">
		<xsl:apply-templates select="catESAD_cu:CIMQuantity"/>
		<xsl:text>:</xsl:text>
		<xsl:for-each select="catESAD_cu:IdentificationMeansDetails">
			<xsl:apply-templates select="catESAD_cu:AggregationKindCode"/>
			<xsl:text>/</xsl:text>
			<xsl:for-each select="catESAD_cu:IdentificationMeansListDetails">
				<xsl:for-each select="catESAD_cu:IdentificationMeansItemDetails">
					<xsl:for-each select="catESAD_cu:IdentificationMeansDataUnitDetails">
						<xsl:apply-templates select="catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
						<xsl:if test="position()!=last()">,</xsl:if>
					</xsl:for-each>
					<xsl:if test="position()!=last()">,</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:if test="catESAD_cu:IdentificationMeansListDetails and catESAD_cu:IdentificationMeansRangeDetails">
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:for-each select="catESAD_cu:IdentificationMeansRangeDetails">
				<xsl:for-each select="catESAD_cu:FirstIdentificationMeansItemDetails">
					<xsl:apply-templates select="catESAD_cu:IdentificationMeansDataUnitDetails/catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
				</xsl:for-each>
				<xsl:text> - </xsl:text>
				<xsl:for-each select="catESAD_cu:LastIdentificationMeansItemDetails">
					<xsl:apply-templates select="catESAD_cu:IdentificationMeansDataUnitDetails/catESAD_cu:IdentifacationMeansUnitCharacterValueId"/>
				</xsl:for-each>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
			<xsl:if test="position()!=last()">;</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="GoodsTraceabilityMeasureDetails">
		<xsl:text>Количество в дополнительной единице измерения, используемой для прослеживаемости товаров: </xsl:text>
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> / </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
	</xsl:template>
	<xsl:template match="*" mode="manufacturer">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Address/catESAD_cu:OKATO">
			<br/>
			<xsl:text>ОКАТО: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Address/catESAD_cu:OKATO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="orgName">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="orgFeatures">
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<br/>
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:for-each select="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
			<xsl:if test="cat_ru:ShortName">
				<span class="graph"> (</span>
				<xsl:apply-templates select="cat_ru:ShortName"/>
				<span class="graph">)</span>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<br/>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<br/>
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<br/>
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<br/>
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<br/>
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<br/>
				<xsl:apply-templates mode="ru_address" select="."/>
			</xsl:for-each>
			<xsl:if test="RUScat_ru:CommunicationDetails">
				<span class="normal">
					<xsl:for-each select="RUScat_ru:CommunicationDetails">
						<br/>
						<xsl:call-template name="CommunicationDetails"/>
					</xsl:for-each>
				</span>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="statf:AccreditationСertificate">
			<br/>
			<xsl:text>НСА: </xsl:text>
			<xsl:apply-templates select="statf:AccreditationСertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:text>№ </xsl:text>
		<xsl:if test="cat_ru:INN">
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> / </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<br>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</br>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:text>№ </xsl:text>
		<xsl:if test="cat_ru:BIN">
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<br>
			<xsl:for-each select="cat_ru:ITN">
				<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</xsl:for-each>
		</br>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:text>№ </xsl:text>
		<xsl:if test="cat_ru:UNP">
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:text>№ </xsl:text>
		<xsl:if test="cat_ru:UNN">
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:text>№ </xsl:text>
		<xsl:if test="cat_ru:KGINN">
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<br/>
		<xsl:apply-templates select="cat_ru:KGOKPO"/>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:apply-templates select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:apply-templates select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:apply-templates select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:apply-templates select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard|RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
