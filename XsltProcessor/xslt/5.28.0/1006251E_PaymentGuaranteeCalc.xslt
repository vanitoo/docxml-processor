<?xml version="1.0" encoding="utf-8"?>
<!-- На основании формы в Решении ЕЭК от 04.09.2017 № 112  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:pgc="urn:customs.ru:Information:CustomsDocuments:PaymentGuaranteeCalc:5.28.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PaymentGuaranteeCalcType -->
	<xsl:template match="pgc:PaymentGuaranteeCalc">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-size: 11pt;
					}

					div
					{
					/*white-space: nowrap;*/
					}

					div.page {
					width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					table-layout: fixed;
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin: 0;
					font-size: 11pt;
					}
					
					td
					{
					word-break:break-all;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
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
				<xsl:variable name="EDocIndicatorCode">
					<xsl:choose>
						<xsl:when test="pgc:EDocIndicatorCode='ОО'"><xsl:value-of select="''"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="pgc:EDocIndicatorCode"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<div class="page">
					<table>
						<tr>
							<td style="width: 32%; border:0;"/>
							<td style="width: 9%; border:0;"/>
							<td style="width: 8%; border:0;"/>
							<td style="width: 8%; border:0;"/>
							<td style="width: 12%; border:0;"/>
							<td style="width: 6%; border:0;"/>
							<td style="width: 7%; border:0;"/>
							<td style="width: 18%; border:0;"/>
						</tr>
						<tr>
							<td colspan="8" class="bordered" style="border-bottom:0;text-align: center;"><b>РАСЧЕТ</b></td>
						</tr>
						<tr>
							<td colspan="8" class="bordered" style="border-top:0;text-align: center;word-break:normal;"><b>размера обеспечения исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</b></td>
						</tr>
						<xsl:call-template name="header1to3">
							<xsl:with-param name="baseOrAdd" select="0"/>
							<xsl:with-param name="cell1" select="pgc:GTDID"/>
							<xsl:with-param name="cell1_2" select="$EDocIndicatorCode"/>
							<xsl:with-param name="cell2" select="'1'"/>
							<xsl:with-param name="cell2_2" select="pgc:PageQuantity"/>
							<xsl:with-param name="cell3" select="pgc:Quantity"/>
						</xsl:call-template>
						<xsl:apply-templates mode="cell4to15" select="pgc:GoodsShipment/pgc:GoodsItemDetails[1]"/>
						<tr valign="top">
							<td colspan="2" class="bordered">16. Размер обеспечения по всем товарам<br/>
								<xsl:for-each select="pgc:GoodsShipment/pgc:GuaranteeDetails/pgc:GuaranteeAmountDetails">
									<xsl:for-each select="*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>-</xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="position()!=last()">
										<br/>
									</xsl:if>
								</xsl:for-each>
							</td>
							<td  colspan="6" class="bordered" rowspan="2">18. Ф.И.О., должность, дата<br/>
								<xsl:apply-templates select="pgc:CustomsPersonSignature"/>
							</td>
						</tr>
						<tr valign="top">
							<td colspan="2" class="bordered">17. Итого размер обеспечения<br/>
								<xsl:for-each select="pgc:GoodsShipment/pgc:GuaranteeDetails/pgc:TotalGuaranteeNAmount">
									<xsl:value-of select="RUScat_ru:Amount"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
									<xsl:if test="position()!=last()">
										<br/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
				</div>
				<xsl:for-each select="pgc:GoodsShipment/pgc:GoodsItemDetails[(position()+1) mod 3 = 0]">
					<div class="page">
						<table>
							<tr>
								<td style="width: 32%; border:0;"/>
								<td style="width: 9%; border:0;"/>
								<td style="width: 8%; border:0;"/>
								<td style="width: 8%; border:0;"/>
								<td style="width: 12%; border:0;"/>
								<td style="width: 6%; border:0;"/>
								<td style="width: 7%; border:0;"/>
								<td style="width: 18%; border:0;"/>
							</tr>
							<xsl:call-template name="header1to3">
								<xsl:with-param name="baseOrAdd" select="1"/>
								<xsl:with-param name="cell1" select="../../pgc:GTDID"/>
								<xsl:with-param name="cell1_2" select="$EDocIndicatorCode"/>
								<xsl:with-param name="cell2" select="pgc:PageOrdinal"/>
								<xsl:with-param name="cell2_2" select="../../pgc:PageQuantity"/>
								<xsl:with-param name="cell3" select="../../pgc:Quantity"/>
							</xsl:call-template>
							<xsl:apply-templates mode="cell4to15" select="."/>
							<xsl:apply-templates mode="cell4to15" select="following-sibling::pgc:GoodsItemDetails[1]"/>
							<xsl:apply-templates mode="cell4to15" select="following-sibling::pgc:GoodsItemDetails[2]"/>
							<tr valign="top">
								<td colspan="2" class="bordered"/>
								<td colspan="6" class="bordered">18. Ф.И.О., должность, дата<br/>
									<xsl:apply-templates select="../../pgc:CustomsPersonSignature"/>
								</td>
							</tr>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="pgc:CustomsPersonSignature">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(cat_ru:PersonName,1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="substring(cat_ru:PersonMiddleName,1)"/>.</xsl:if>
		<xsl:if test="cat_ru:PersonPost or RUScat_ru:LNP or RUScat_ru:CustomsCode">
			<br/>
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:if test="RUScat_ru:LNP"> ЛНП: <xsl:value-of select="RUScat_ru:LNP"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CustomsCode"> (код ТО: <xsl:value-of select="RUScat_ru:CustomsCode"/>)</xsl:if>
		</xsl:if>
		<xsl:if test="pgc:IssueDate">
			<br/>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="pgc:IssueDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="cell4to15" match="pgc:GoodsItemDetails">
		<tr valign="top">
			<td colspan="2" class="bordered" style="border-bottom:0;">4. Описание товара</td>
			<td colspan="2" class="bordered" style="border-bottom:0;">5. Товар №</td>
			<td colspan="4" class="bordered" style="border-bottom:0;">6. Код товара</td>
		</tr>
		<tr valign="top">
			<td colspan="2" class="bordered" rowspan="3" style="border-top:0;word-break: break-all;">
				<xsl:apply-templates select="RUScat_ru:GoodsDescription"/>
				<br/>
				<xsl:apply-templates select="pgc:GoodsGroupDescription"/>
			</td>
			<td class="bordered" style="border-top:0;">
				<xsl:value-of select="RUScat_ru:GoodsNumeric"/>
			</td>
			<td class="bordered" style="border-top:0;">
				<xsl:value-of select="pgc:DTConsignmentItemOrdinal"/>
			</td>
			<td colspan="4" class="bordered" style="border-top:0;">
				<xsl:value-of select="RUScat_ru:GoodsTNVEDCode"/>
			</td>
		</tr>
		<tr valign="top">
			<td colspan="2" class="bordered">
				7. Код страны происхождения<br/>
				<xsl:value-of select="pgc:OriginCountryDetails/RUScat_ru:CountryCode"/>
			</td>
			<td class="bordered">
				8. Льготы и преференции<br/>
				<xsl:apply-templates select="pgc:PreferenceDetails"/>
			</td>
			<td colspan="2" class="bordered">
				9. Вес<br/>нетто (кг)<br/>
				<xsl:value-of select="RUScat_ru:UnifiedNetMassMeasure"/>
			</td>
			<td class="bordered">
				10.Дополнительная<br/>единица<br/>
				<xsl:for-each select="RUScat_ru:GoodsMeasureDetails">
					<xsl:apply-templates mode="quantityMeasure" select="."/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<tr valign="top">
			<td colspan="3" class="bordered">11. Таможенная стоимость<br/>
				<xsl:value-of select="pgc:ReasonCalculationPayment"/>
			</td>
			<td colspan="3" class="bordered">12. Код проверки<br/>
				<xsl:for-each select="pgc:CustomsCheckCodeDetails/*">
					<xsl:choose>
						<xsl:when test=".='true' or .=1">1</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position()!=last()">/</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td colspan="8" class="bordered" valign="top">13. Дополнительная информация, представленные документы<br/>
				<xsl:for-each select="pgc:PresentedDocDetails">
					<xsl:value-of select="pgc:DocKindCode"/>
					<xsl:text> / </xsl:text>
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
					<xsl:text> / </xsl:text>
					<xsl:for-each select="pgc:InformationSourceDetails">
						<xsl:value-of select="pgc:InformationSourceName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="pgc:DetailsResourceId"/>
					</xsl:for-each>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:variable name="cnt_GIPD" select="count(pgc:GoodsItemPaymentDetails)"/>
		<xsl:variable name="cnt_GIGD" select="count(pgc:GoodsItemGuaranteeDetails)"/>
		<xsl:variable name="cnt_r">
			<xsl:choose>
				<xsl:when test="$cnt_GIPD &gt; $cnt_GIGD"><xsl:value-of select="$cnt_GIPD"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$cnt_GIGD"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<tr valign="top">
			<td colspan="2" class="bordered">14. Исчисление платежей</td>
			<td colspan="6" class="bordered" style="padding:0;">15. Размер обеспечения</td>
		</tr>
		<tr valign="top">
			<td colspan="2" class="bordered">
				<table style="font-size:10pt;">
					<tr valign="top">
						<td class="bordered" style="width:10%;border-left:0;border-top:0;word-break:normal;">Вид</td>
						<td class="bordered" style="width:26%;border-top:0;word-break:normal;">База для исчисления</td>
						<td class="bordered" style="width:28%;border-top:0;word-break:normal;">Ставка</td>
						<td class="bordered" style="width:28%;border-top:0;word-break:normal;">Сумма</td>
						<td class="bordered" style="width:8%;border-right:0;border-top:0;word-break:normal;">СП</td>
					</tr>
					<xsl:for-each select="pgc:GoodsItemPaymentDetails">
						<tr valign="top">
							<xsl:variable name="style_t1_c1">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="'border-left:0;'"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-left:0;border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t1_c1}">
								<xsl:value-of select="RUDECLcat:PaymentModeCode"/>
							</td>
							<xsl:variable name="style_t1_c2_4">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="''"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t1_c2_4}">
								<xsl:value-of select="RUDECLcat:TaxBase"/>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="RUDECLcat:TaxBaseCurrencyCode">
										<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
									</xsl:when>
									<xsl:when test="RUDECLcat:TaxBaseQualifierCode">
										<xsl:value-of select="RUDECLcat:TaxBaseQualifierCode"/>
									</xsl:when>
								</xsl:choose>
							</td>
							<td class="bordered" style="{$style_t1_c2_4}">
								<xsl:apply-templates mode="rate1" select="."/>
							</td>
							<td class="bordered" style="{$style_t1_c2_4}">
								<xsl:value-of select="RUDECLcat:PaymentAmount"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="RUDECLcat:PaymentCurrencyCode"/>
							</td>
							<xsl:variable name="style_t1_c5">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="'border-right:0;'"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-right:0;border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t1_c5}">
								<xsl:value-of select="RUDECLcat:PaymentCode"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</td>
			<td colspan="6" class="bordered" style="padding:0;">
				<table style="font-size:10pt;">
					<tr valign="top">
						<td class="bordered" style="width:8%;border-left:0;border-top:0;word-break:normal;">Вид</td>
						<td class="bordered" style="width:31%;border-top:0;word-break:normal;">Сумма</td>
						<td class="bordered" style="width:31%;border-top:0;word-break:normal;">Предыдущая<br/>сумма</td>
						<td class="bordered" style="width:30%;border-right:0;border-top:0;word-break:normal;">Изменения</td>
					</tr>
					<xsl:for-each select="pgc:GoodsItemGuaranteeDetails">
						<tr valign="top">
							<xsl:variable name="style_t2_c1">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="'border-left:0;'"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-left:0;border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t2_c1}">
								<xsl:value-of select="pgc:CustomsTaxModeCode"/>
							</td>
							<xsl:variable name="style_t2_c2_3">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="''"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t2_c2_3}">
								<xsl:value-of select="pgc:PaymentAmount"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="pgc:PaymentCurrencyCode"/>
							</td>
							<td class="bordered" style="{$style_t2_c2_3}">
								<xsl:value-of select="pgc:PreviousPaymentAmount"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="pgc:PreviousPaymentCurrencyCode"/>
							</td>
							<xsl:variable name="style_t2_c4">
								<xsl:choose>
									<xsl:when test="(position()=last()) and (position() &lt; $cnt_r)"><xsl:value-of select="'border-right:0;'"/></xsl:when>
									<xsl:otherwise><xsl:value-of select="'border-right:0;border-bottom:0;'"/></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<td class="bordered" style="{$style_t2_c4}">
								<xsl:value-of select="pgc:DifferencePaymentAmount"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates select="pgc:DifferencePaymentCurrencyCode"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="pgc:GoodsGroupDescription">
		<xsl:if test="position() > 1">
			<br/>
			<br/>
		</xsl:if>
		<xsl:apply-templates mode="spaceSeparatedText" select="pgc:GoodsDescription"/>
		<xsl:for-each select="pgc:CommodityGroupItemDetails">
			<br/>
			<xsl:if test="pgc:CommodityDescriptionDetails">
				<xsl:for-each select="pgc:CommodityDescriptionDetails">
					<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber']">
						<xsl:if test="position()!=1 and local-name()!='SerialNumber'"><xsl:text>, </xsl:text></xsl:if>
						<xsl:choose>
							<xsl:when test="local-name()='WoodDescriptionDetails'">
								<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
							</xsl:when>
							<xsl:when test="local-name()='DateIssue'">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="."/>
								</xsl:call-template> 
							</xsl:when>
							<xsl:when test="local-name()='Dimensions'">
								<xsl:apply-templates mode="Dimensions" select="."/>
							</xsl:when>
							<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
								<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
								<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
								<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
								<!--xsl:for-each select="../*[local-name()='SerialNumber']">
									<xsl:value-of select="."/>
								</xsl:for-each-->
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="local-name()!='SerialNumber'">
									<xsl:apply-templates select="."/>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="pgc:ProductionPlaceName">
				<xsl:text>, </xsl:text>
				<xsl:text>Место происхождения </xsl:text>
				<xsl:apply-templates select="pgc:ProductionPlaceName"/>
			</xsl:if>
			<xsl:if test="pgc:StandardName">
				<xsl:text>, </xsl:text>
				<xsl:text>Наименование стандарта </xsl:text>
				<xsl:apply-templates select="pgc:StandardName"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Выводит текст элементов, разделённый пробелами-->
	<xsl:template match="*" mode="spaceSeparatedText">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='WoodSortiment'">
				<xsl:text>Наим.сортимента: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='WoodKind'">
				<xsl:text>Порода древесины: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='ProductSortName'">
				<xsl:text>Наименование сорта:</xsl:text>
				<xsl:value-of select="."/>
			</xsl:if>
			<xsl:if test="local-name()='AllowanceDetails'">
				<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='DeviationDetails'">
				<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
				<xsl:text>Диапазон диаметров: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select=".">
					<xsl:with-param name="separator" select="'-'"/>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='ContractVolumeMeasure'">
				<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='FactVolumeMeasure'">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate !=''">
					<xsl:value-of select="RUDECLcat:Rate"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='%' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode or RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>%</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="pgc:PreferenceDetails">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">-</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="header1to3">
		<xsl:param name="baseOrAdd" select="0"/>
		<xsl:param name="cell1"/>
		<xsl:param name="cell1_2"/>
		<xsl:param name="cell2"/>
		<xsl:param name="cell2_2"/>
		<xsl:param name="cell3"/>
		<tr valign="top">
			<td colspan="2" class="bordered" style="border-bottom:0;">1. Номер декларации на товары</td>
			<td colspan="2" class="bordered" style="border-bottom:0;">2. Кол-во листов</td>
			<td colspan="2" class="bordered" style="border-bottom:0">3. Всего товаров</td>
			<td colspan="2" class="bordered" rowspan="2" align="center">
				<xsl:choose>
					<xsl:when test="$baseOrAdd=0">ОСНОВНОЙ ЛИСТ</xsl:when>
					<xsl:otherwise>ДОБАВОЧНЫЙ ЛИСТ</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td class="bordered" style="border-top:0;">
				<xsl:apply-templates mode="GTD_number" select="$cell1"/>
			</td>
			<td class="bordered" style="border-top:0;">
				<xsl:value-of select="$cell1_2"/>
			</td>
			<td class="bordered" style="border-top:0;">
				<xsl:value-of select="$cell2"/>
			</td>
			<td class="bordered" style="border-top:0;">
				<xsl:value-of select="$cell2_2"/>
			</td>
			<td colspan="2" class="bordered" style="border-top:0">
				<xsl:value-of select="$cell3"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template mode="GTD_number" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTD_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template mode="quantityMeasure" match="*">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
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
	<xsl:template name="GTD_date">
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
	<xsl:template match="pgc:PaymentCurrencyCode | pgc:PreviousPaymentCurrencyCode | pgc:DifferencePaymentCurrencyCode | pgc:TaxBaseCurrencyCode | RUDECLcat:RateCurrencyCode | RUScat_ru:CurrencyCode">
		<!--xsl:choose>
			<xsl:when test=".='643'">RUB</xsl:when>
			<xsl:when test=".='840'">USD</xsl:when>
			<xsl:when test=".='978'">EUR</xsl:when>
			<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose-->
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="RUDECLcat:RateTNVEDQualifierCode">
		<xsl:choose>
			<xsl:when test=".='006'">МЕТР</xsl:when>
			<xsl:when test=".='055'">КВАДРАТНЫЙ МЕТР</xsl:when>
			<xsl:when test=".='111'">КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
			<xsl:when test=".='112'">ЛИТР</xsl:when>
			<xsl:when test=".='113'">КУБИЧЕСКИЙ МЕТР</xsl:when>
			<xsl:when test=".='114'">1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
			<xsl:when test=".='117'">ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
			<xsl:when test=".='118'">КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
			<xsl:when test=".='130'">1000 ЛИТРОВ</xsl:when>
			<xsl:when test=".='162'">МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
			<xsl:when test=".='163'">ГРАММ</xsl:when>
			<xsl:when test=".='166'">КИЛОГРАММ</xsl:when>
			<xsl:when test=".='168'">ТОННУ ВЕСА НЕТТО</xsl:when>
			<xsl:when test=".='185'">ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
			<xsl:when test=".='214'">КИЛОВАТТ</xsl:when>
			<xsl:when test=".='246'">1000 КИЛОВАТТ В ЧАС</xsl:when>
			<xsl:when test=".='251'">ЛОШАДИНУЮ СИЛУ</xsl:when>
			<xsl:when test=".='305'">КЮРИ</xsl:when>
			<xsl:when test=".='306'">ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
			<xsl:when test=".='715'">ПАРУ</xsl:when>
			<xsl:when test=".='796'">ШТУКУ</xsl:when>
			<xsl:when test=".='797'">СТО ШТУК</xsl:when>
			<xsl:when test=".='798'">ТЫСЯЧУ ШТУК</xsl:when>
			<xsl:when test=".='831'">ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
			<xsl:when test=".='841'">КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
			<xsl:when test=".='845'">КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
			<xsl:when test=".='852'">КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='859'">КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
			<xsl:when test=".='861'">КИЛОГРАММ АЗОТА</xsl:when>
			<xsl:when test=".='863'">КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
			<xsl:when test=".='865'">КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
			<xsl:when test=".='867'">КИЛОГРАММ УРАНА</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
