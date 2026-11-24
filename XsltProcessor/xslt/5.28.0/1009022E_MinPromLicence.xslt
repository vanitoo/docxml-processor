<?xml version="1.0" encoding="UTF-8"?>
<!-- (код вида документа 01011) -->
<!-- Решение Коллегии Евразийской экономической комиссии от 06.11.2014 № 199, + письмо ГУИТ от 09.12.2016 № 14-147/0136 -->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:minprl="urn:customs.ru:Information:SQDocuments:MinPromLicence:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:decimal-format name="spaces" decimal-separator="," grouping-separator=" "/>
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
	<xsl:template match="*" mode="format_number_groups">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(., '# ###,##', 'spaces')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_quantity">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(., '# ###,#####', 'spaces')"/>
		</element>
	</xsl:template>
	<xsl:template match="minprl:MinPromLicence">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Ответ на запрос сведений о лицензии на ввоз/вывоз товара с территории Таможенного союза</title>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Times New Roman;
					text-decoration: underline;
				}
				
				.header {
					font: 12;
					font-family: Times New Roman;
					font-weight:bold;
				}
				
				table {
					width: 100%;
					border-collapse: collapse;
				}

				.signature {
					font-family: Arial, serif;
					font: 10;
					border-bottom: 0;
					border-right: 0;
					border-left: 0;
				}
				.bordered{
					border:1px solid black;
				}
				.arial{
					font-family: Arial;
				}
			</style>
			</head>
			<body>
				<xsl:if test="minprl:DocKind = 1">
					<div class="page">
						<xsl:variable name="typeLic" select="translate(minprl:License/minprl:LicOperation,'имэкспорт','ИМЭКСПОРТ')"/>
						<table class="w190" cellpadding="3">
							<tr class="header">
								<td class="bordered" colspan="6" align="center">МИНИСТЕРСТВО ПРОМЫШЛЕННОСТИ И ТОРГОВЛИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3">
									1. Лицензия<br/>
									<span class="arial">
										№ <xsl:apply-templates select="minprl:License/minprl:Licence/cat_ru:PrDocumentNumber"/>
									</span>
								</td>
								<td class="bordered" colspan="3">
									2. Период действия<br/>
									<span class="arial">
										<xsl:if test="minprl:License/minprl:StartDate">
											<xsl:text>c </xsl:text>
											<xsl:apply-templates select="minprl:License/minprl:StartDate" mode="russian_date"/>
										</xsl:if>
										<xsl:if test="minprl:License/minprl:DateTo">
											<xsl:text> по </xsl:text>
											<xsl:apply-templates select="minprl:License/minprl:DateTo" mode="russian_date"/>
										</xsl:if>
									</span>
									<xsl:if test="minprl:LicenseStatus">
										<br/>
										<xsl:choose>
											<xsl:when test="minprl:LicenseStatus=1">
												<b>
													<span class="arial" style="color: green;">Статус лицензии: Оформлена</span>
												</b>
											</xsl:when>
											<xsl:when test="minprl:LicenseStatus=2">
												<b>
													<span class="arial" style="color: red;">Статус лицензии: Действие прекращено</span>
												</b>
											</xsl:when>
											<xsl:when test="minprl:LicenseStatus=3">
												<b>
													<span class="arial" style="color: red;">Статус лицензии: Приостановлена</span>
												</b>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">3. Тип лицензии</td>
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">4. Контракт</td>
							</tr>
							<tr valign="top">
								<td class="bordered" style="border-top:0; width:25%" align="center">
									<xsl:apply-templates select="minprl:License/minprl:LicType"/>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:25%" align="center">
									<!--xsl:value-of select="$typeLic"/-->
									<xsl:apply-templates select="minprl:License/minprl:LicOperation"/>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:text>№ </xsl:text>
										<xsl:choose>
											<xsl:when test="minprl:Contract/cat_ru:PrDocumentNumber">
												<xsl:apply-templates select="minprl:Contract/cat_ru:PrDocumentNumber"/>
											</xsl:when>
											<xsl:otherwise>б/н</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="minprl:Contract/cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="minprl:Contract/cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">5. Заявитель</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
											</xsl:when>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">6. Продавец</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">6. Покупатель</xsl:when>
										<xsl:otherwise>6. Продавец / Покупатель</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<xsl:apply-templates mode="company" select="minprl:License/minprl:Holder"/>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<xsl:apply-templates mode="company" select="minprl:Dealer"/>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">7. Страна отправления</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">7. Страна назначения</xsl:when>
										<xsl:otherwise>7. Страна отправления / назначения</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Country7Info/minprl:CountryAlpha2"/>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">8. Страна продавца</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">8. Страна покупателя</xsl:when>
										<xsl:otherwise>8. Страна продавца / покупателя</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<!--xsl:if test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode!='EU'">
											<xsl:apply-templates select="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode"/>
										</xsl:if-->
										<xsl:if test="minprl:Dealer/minprl:Country/minprl:CountryAlpha2!='EU'">
											<xsl:apply-templates select="minprl:Dealer/minprl:Country/minprl:CountryAlpha2"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:apply-templates select="minprl:Country7Info/minprl:CountryName"/>
									</span>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<!--xsl:choose>
											<xsl:when test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CounryName">
												<xsl:apply-templates select="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CounryName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:if test="minprl:Dealer/minprl:DealerAddress/RUScat_ru:CountryCode='EU'">Страны ЕС</xsl:if>
											</xsl:otherwise>
										</xsl:choose-->
										<xsl:choose>
											<xsl:when test="minprl:Dealer/minprl:Country/minprl:CountryAlpha2='EU'">Страны ЕС</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="minprl:Dealer/minprl:Country/minprl:CountryName"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">9. Валюта контракта</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Cost/minprl:ContractCurrencyCode"/>
									</span>
								</td>
								<td class="bordered" style="border-bottom:0; width:20%">10. Стоимость</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:30%">11. Статистическая стоимость</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:apply-templates select="minprl:Cost/minprl:ContractCurrencyName"/>
									</span>
								</td>
								<td class="bordered" style="border-top:0; width:20%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Cost/minprl:CurrencyCost &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Cost/minprl:CurrencyCost, '# ###,##', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Cost/minprl:CurrencyCost" mode="format_number_groups"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Cost/minprl:StatCost &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Cost/minprl:StatCost, '# ###,##', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Cost/minprl:StatCost" mode="format_number_groups"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">12. Страна происхождения</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU' or minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">&#160;</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="minprl:OriginCountry/minprl:CountryAlpha2"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" style="border-bottom:0; width:20%">13. Количество</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:30%">14. Единица измерения</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:OriginCountry/minprl:CountryName">
												<xsl:apply-templates select="minprl:OriginCountry/minprl:CountryName"/>
											</xsl:when>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU'">Страны ЕС</xsl:when>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">В соответствии с условиями контрактов (договоров)</xsl:when>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" style="border-top:0; width:20%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Quantity/RUScat_ru:GoodsQuantity &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Quantity/RUScat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Quantity/RUScat_ru:GoodsQuantity" mode="format_number_quantity"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="minprl:AddQuantity">
											<br/>
											<xsl:choose>
												<xsl:when test="minprl:AddQuantity/RUScat_ru:GoodsQuantity &gt; 0">
													<!--xsl:value-of select="format-number(minprl:AddQuantity/RUScat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/-->
													<xsl:apply-templates select="minprl:AddQuantity/RUScat_ru:GoodsQuantity" mode="format_number_quantity"/>
												</xsl:when>
												<xsl:otherwise>0</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Quantity/RUScat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="minprl:AddQuantity">
											<br/>
											<xsl:apply-templates select="minprl:AddQuantity/RUScat_ru:MeasureUnitQualifierName"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="5" style="border-bottom:0; width:88%">15. Код товара по ТН ВЭД ЕАЭС и его описание</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:NomenclatureCode"/>
									</span>
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="6" style="border-top:0">
									<span class="arial">
										<xsl:apply-templates select="minprl:NomenclatureDescription"/>
										<xsl:if test="minprl:Addendum">
											<br/>(см. приложение на&#160;<u>&#160;1&#160;</u>&#160;листе)
											<!--xsl:choose>
												<xsl:when test="minprl:Addendum &gt; 1"><u>&#160;<xsl:apply-templates select="minprl:AddendumTotalPages"/>&#160;</u>&#160;листах)</xsl:when>
												<xsl:otherwise><u>&#160;1&#160;</u>&#160;листе)</xsl:otherwise>
											</xsl:choose-->
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="6">
									16. Дополнительная информация<br/>
									<span class="arial">
										<xsl:apply-templates select="minprl:AddInfo"/>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="width:50%">
									17. Основание для выдачи лицензии<br/>
									<span class="arial">
										<xsl:for-each select="minprl:License/minprl:Reason">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</span>
								</td>
								<td class="bordered" colspan="3" style="width:50%">
									18. Уполномоченное лицо<br/>
									<xsl:apply-templates select="minprl:License/minprl:SignPerson" mode="sign"/>
								</td>
							</tr>
						</table>
					</div>
					<xsl:if test="minprl:Addendum">
						<div class="page">
							<table class="w190" cellpadding="3">
								<tr class="header">
									<td class="bordered" colspan="4" align="center">МИНИСТЕРСТВО ПРОМЫШЛЕННОСТИ И ТОРГОВЛИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
								</tr>
								<tr valign="top">
									<td class="bordered" colspan="4" align="center">
										ПРИЛОЖЕНИЕ К ЛИЦЕНЗИИ № <span class="arial">
											<xsl:apply-templates select="minprl:License/minprl:Licence/cat_ru:PrDocumentNumber"/>
										</span>
										&#160;ОТ <span class="arial">
											<xsl:apply-templates select="minprl:License/minprl:SignPerson/cat_ru:IssueDate" mode="russian_date"/>
										</span>
									</td>
								</tr>
								<xsl:for-each select="minprl:Addendum">
									<tr valign="top">
										<td class="bordered" rowspan="4" style="width:5%" align="center">
											<xsl:apply-templates select="minprl:PositionNumber"/>
										</td>
										<td class="bordered" style="border-bottom:0; width:45%">Описание товара</td>
										<td class="bordered" style="border-bottom:0; width:30%">Количество</td>
										<td class="bordered" style="border-bottom:0; width:20%">Единица измерения</td>
									</tr>
									<tr valign="top">
										<td class="bordered" rowspan="3" style="border-top:0; width:45%">
											<span class="arial">
												<xsl:apply-templates select="minprl:CommodityName"/>
											</span>
										</td>
										<td class="bordered" style="border-top:0; width:30%" align="center">
											<span class="arial">
												<xsl:for-each select="minprl:LicAddendumMeasureItem">
													<xsl:choose>
														<xsl:when test="RUScat_ru:GoodsQuantity &gt; 0">
															<xsl:value-of select="format-number(RUScat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/>
														</xsl:when>
														<xsl:otherwise>0</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</span>
										</td>
										<td class="bordered" rowspan="3" style="border-top:0; width:20%" align="center">
											<xsl:for-each select="minprl:LicAddendumMeasureItem">
												<span class="arial">
													<xsl:apply-templates select="RUScat_ru:MeasureUnitQualifierName"/>
												</span>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-bottom:0; width:30%">Стоимость</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-top:0; width:30%" align="center">
											<span class="arial">
												<xsl:value-of select="format-number(minprl:Cost, '# ###,##', 'spaces')"/>
											</span>
										</td>
									</tr>
								</xsl:for-each>
								<tr valign="top">
									<td class="bordered" colspan="2" style="width:50%" align="center" valign="middle">
										<span class="arial">ЛИСТ 1 ВСЕГО ЛИСТОВ 1</span>
									</td>
									<td class="bordered" colspan="2" style="width:50%">
										<xsl:apply-templates select="minprl:License/minprl:SignPerson" mode="sign"/>
									</td>
								</tr>
							</table>
						</div>
					</xsl:if>
				</xsl:if>
				<xsl:if test="minprl:DocKind = 2">
					<div class="page">
						<xsl:variable name="typeLic" select="translate(minprl:License/minprl:LicOperation,'имэкспорт','ИМЭКСПОРТ')"/>
						<table class="w190" cellpadding="3">
							<tr class="header">
								<td class="bordered" colspan="6" align="center">МИНИСТЕРСТВО ПРОМЫШЛЕННОСТИ И ТОРГОВЛИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3">
									1. Разрешение<br/>
									<span class="arial">
										№ <xsl:apply-templates select="minprl:License/minprl:Licence/cat_ru:PrDocumentNumber"/>
									</span>
								</td>
								<td class="bordered" colspan="3">
									2. Период действия<br/>
									<span class="arial">
										<xsl:if test="minprl:License/minprl:StartDate">
											<xsl:text>c </xsl:text>
											<xsl:apply-templates select="minprl:License/minprl:StartDate" mode="russian_date"/>
										</xsl:if>
										<xsl:if test="minprl:License/minprl:DateTo">
											<xsl:text> по </xsl:text>
											<xsl:apply-templates select="minprl:License/minprl:DateTo" mode="russian_date"/>
										</xsl:if>
									</span>
									<xsl:if test="minprl:IsCanceled">
										<br/>
										<xsl:choose>
											<xsl:when test="minprl:IsCanceled='true' or minprl:IsCanceled=1">
												<b>
													<span class="arial" style="color: green;">Статус документа: действует</span>
												</b>
											</xsl:when>
											<xsl:when test="minprl:IsCanceled='false' or minprl:IsCanceled=0">
												<b>
													<span class="arial" style="color: red;">Статус документа: не действует</span>
												</b>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">3. Тип разрешения</td>
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">4. Контракт</td>
							</tr>
							<tr valign="top">
								<td class="bordered" style="border-top:0; width:25%" align="center">
									<xsl:apply-templates select="minprl:License/minprl:LicType"/>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:25%" align="center">
									<!--xsl:value-of select="$typeLic"/-->
									<xsl:apply-templates select="minprl:License/minprl:LicOperation"/>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:text>№ </xsl:text>
										<xsl:choose>
											<xsl:when test="minprl:Contract/cat_ru:PrDocumentNumber">
												<xsl:apply-templates select="minprl:Contract/cat_ru:PrDocumentNumber"/>
											</xsl:when>
											<xsl:otherwise>б/н</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="minprl:Contract/cat_ru:PrDocumentDate">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="minprl:Contract/cat_ru:PrDocumentDate" mode="russian_date"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">5. Заявитель</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
											</xsl:when>
											<xsl:when test="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures">
												<xsl:apply-templates select="minprl:License/minprl:Holder/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
											</xsl:when>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" colspan="3" style="border-bottom:0; width:50%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">6. Продавец</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">6. Покупатель</xsl:when>
										<xsl:otherwise>6. Продавец / Покупатель</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<xsl:apply-templates mode="company" select="minprl:License/minprl:Holder"/>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<xsl:apply-templates mode="company" select="minprl:Dealer"/>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">7. Страна отправления</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">7. Страна назначения</xsl:when>
										<xsl:otherwise>7. Страна отправления / назначения</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Country7Info/minprl:CountryAlpha2"/>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">
									<xsl:choose>
										<xsl:when test="substring($typeLic,1,1)='И'">8. Страна продавца</xsl:when>
										<xsl:when test="substring($typeLic,1,1)='Э'">8. Страна покупателя</xsl:when>
										<xsl:otherwise>8. Страна продавца / покупателя</xsl:otherwise>
									</xsl:choose>
								</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:if test="minprl:Dealer/minprl:Country/minprl:CountryAlpha2!='EU'">
											<xsl:apply-templates select="minprl:Dealer/minprl:Country/minprl:CountryAlpha2"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:apply-templates select="minprl:Country7Info/minprl:CountryName"/>
									</span>
								</td>
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Dealer/minprl:Country/minprl:CountryAlpha2='EU'">Страны ЕС</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="minprl:Dealer/minprl:Country/minprl:CountryName"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">9. Валюта контракта</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Cost/minprl:ContractCurrencyCode"/>
									</span>
								</td>
								<td class="bordered" style="border-bottom:0; width:20%">10. Стоимость</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:30%">11. Статистическая стоимость</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:apply-templates select="minprl:Cost/minprl:ContractCurrencyName"/>
									</span>
								</td>
								<td class="bordered" style="border-top:0; width:20%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Cost/minprl:CurrencyCost &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Cost/minprl:CurrencyCost, '# ###,##', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Cost/minprl:CurrencyCost" mode="format_number_groups"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Cost/minprl:StatCost &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Cost/minprl:StatCost, '# ###,##', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Cost/minprl:StatCost" mode="format_number_groups"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="2" style="border-bottom:0; width:38%">12. Страна происхождения</td>
								<td class="bordered" style="border-bottom:0; width:12%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU' or minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">&#160;</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="minprl:OriginCountry/minprl:CountryAlpha2"/>
											</xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" style="border-bottom:0; width:20%">13. Количество</td>
								<td class="bordered" colspan="2" style="border-bottom:0; width:30%">14. Единица измерения</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="border-top:0; width:50%">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:OriginCountry/minprl:CountryName">
												<xsl:apply-templates select="minprl:OriginCountry/minprl:CountryName"/>
											</xsl:when>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='EU'">Страны ЕС</xsl:when>
											<xsl:when test="minprl:OriginCountry/minprl:CountryAlpha2='00' or minprl:OriginCountry/minprl:CountryAlpha2='99'">В соответствии с условиями контрактов (договоров)</xsl:when>
										</xsl:choose>
									</span>
								</td>
								<td class="bordered" style="border-top:0; width:20%" align="center">
									<span class="arial">
										<xsl:choose>
											<xsl:when test="minprl:Quantity/RUScat_ru:GoodsQuantity &gt; 0">
												<!--xsl:value-of select="format-number(minprl:Quantity/RUScat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/-->
												<xsl:apply-templates select="minprl:Quantity/RUScat_ru:GoodsQuantity" mode="format_number_quantity"/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="minprl:AddQuantity">
											<br/>
											<xsl:choose>
												<xsl:when test="minprl:AddQuantity/RUScat_ru:GoodsQuantity &gt; 0">
													<!--xsl:value-of select="format-number(minprl:AddQuantity/RUScat_ru:GoodsQuantity, '# ###,#####', 'spaces')"/-->
													<xsl:apply-templates select="minprl:AddQuantity/RUScat_ru:GoodsQuantity" mode="format_number_quantity"/>
												</xsl:when>
												<xsl:otherwise>0</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</span>
								</td>
								<td class="bordered" colspan="2" style="border-top:0; width:30%" align="center">
									<span class="arial">
										<xsl:apply-templates select="minprl:Quantity/RUScat_ru:MeasureUnitQualifierName"/>
										<xsl:if test="minprl:AddQuantity">
											<br/>
											<xsl:apply-templates select="minprl:AddQuantity/RUScat_ru:MeasureUnitQualifierName"/>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="5" style="border-bottom:0; border-right: 0; width:88%">15. Код товара по ЕТН ВЭД и его описание</td>
								<td class="bordered" style="border-bottom:0; border-left: 0; width:12%" align="center">
									<!--span class="arial">
										<xsl:apply-templates select="minprl:NomenclatureCode"/>
									</span-->
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="6" style="border-top:0">
									<span class="arial">
										<xsl:apply-templates select="minprl:NomenclatureCode"/>
										<br/>
										<xsl:apply-templates select="minprl:NomenclatureDescription"/>
										<!--xsl:if test="minprl:Addendum">
											<br/>(см. приложение на&#160;<u>&#160;1&#160;</u>&#160;листе)-->
										<!--xsl:choose>
												<xsl:when test="minprl:Addendum &gt; 1"><u>&#160;<xsl:apply-templates select="minprl:AddendumTotalPages"/>&#160;</u>&#160;листах)</xsl:when>
												<xsl:otherwise><u>&#160;1&#160;</u>&#160;листе)</xsl:otherwise>
											</xsl:choose-->
										<!--/xsl:if-->
									</span>
								</td>
							</tr>
							<tr valign="top" style="height:30mm">
								<td class="bordered" colspan="6">
									16. Дополнительная информация<br/>
									<span class="arial">
										<xsl:apply-templates select="minprl:AddInfo"/>
									</span>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" colspan="3" style="width:50%">
									17. Уполномоченное лицо заявителя<br/>
									<xsl:apply-templates select="minprl:License/minprl:HolderPerson" mode="sign"/>
								</td>
								<td class="bordered" colspan="3" style="width:50%">
									18. Уполномоченное лицо<br/>
									<xsl:apply-templates select="minprl:License/minprl:SignPerson" mode="sign"/>
								</td>
							</tr>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
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
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:apply-templates select="RUScat_ru:CountryCode"/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:if test="RUScat_ru:CountryCode">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName">, </xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">серия <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>&#160;</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">№ <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="sign" match="*">
		<table>
			<tr>
				<td style="width:25mm;">Ф.И.О.</td>
				<td colspan="2">
					<span class="arial">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
							<xsl:text>.</xsl:text>
						</xsl:if>
					</span>
				</td>
			</tr>
			<tr>
				<td style="width:25mm;">Должность</td>
				<td colspan="2">
					<span class="arial">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</span>
				</td>
			</tr>
			<xsl:variable name="docKind" select="../../minprl:DocKind"/>
			<xsl:if test="$docKind=1">
				<tr>
					<td style="width:25mm;">Подразделение</td>
					<td colspan="2">
						<span class="arial">
							<xsl:apply-templates select="../minprl:DepartmentShortName"/>
							<xsl:if test="../minprl:DepartmentCode"> (код: <xsl:apply-templates select="../minprl:DepartmentCode"/>)</xsl:if>
						</span>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$docKind=2">
				<xsl:choose>
					<xsl:when test="local-name(.) = 'HolderPerson'">
						<tr>
							<td style="width:25mm;">Телефон</td>
							<td colspan="2">
								<span class="arial">
									<xsl:apply-templates select="minprl:Phone"/>
								</span>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<td colspan="3">
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<tr>
				<td colspan="3">
					<br/>
				</td>
			</tr>
			<tr>
				<td colspan="2">Подпись и печать</td>
				<td style="width:35mm">Дата 
					<span class="arial">
						<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
					</span>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="//*[local-name()='MinPromLicence']//*" priority="-1">
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
	<xsl:template mode="company" match="*">
		<span class="arial">
			<xsl:apply-templates select="cat_ru:OrganizationName"/>
			<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
				<xsl:apply-templates select="cat_ru:ShortName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails or minprl:DealerAddress">
				<br/>
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails| minprl:DealerAddress">
					<xsl:apply-templates mode="ru_address" select="."/>
					<xsl:if test="position()!=last()">; </xsl:if>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="cat_ru:Address">
				<br/>
				<xsl:apply-templates mode="ru_address" select="."/>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<br/>
				<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
			</xsl:if>
		</span>
	</xsl:template>
</xsl:stylesheet>
