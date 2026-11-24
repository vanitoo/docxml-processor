<?xml version="1.0" encoding="utf-8"?>
<!-- Решение Коллегии ЕЭК от 20.11.2018 № 185 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:PTDEGP="urn:customs.ru:Information:CustomsDocuments:PTDExpressGoodsPayInfo:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PTDExpressGoodsPayInfoType -->
	<xsl:template match="PTDEGP:PTDExpressGoodsPayInfo">
		<xsl:param name="w" select="190"/>
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
                  margin-top: 1px;
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
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="2">
										<b>ДОКУМЕНТ ОБ УПЛАТЕ<br/>
таможенных пошлин, налогов в отношении товаров для личного пользования,<br/>
таможенное декларирование которых осуществляется с использованием пассажирской таможенной декларации для экспресс-грузов
</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
							<tbody>
								<tr>
									<td class="bordered" colspan="6">№ пассажирской таможенной декларации для экспресс-грузов
										<br/>
										<xsl:apply-templates mode="reg_num" select="PTDEGP:PassDTNumberDetails"/>
										<xsl:if test="PTDEGP:NumPP">
											<xsl:text>/</xsl:text>
											<xsl:variable name="numval" select="concat('000', PTDEGP:NumPP)"/>
											<xsl:value-of select="substring($numval, string-length($numval) - 2)"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" colspan="6">B. Исчисление платежей</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">Индивидуальная накладная</td>
									<!--td class="bordered">Уникальный идентификатор накладной в реестре</td-->
									<td class="bordered">Вид</td>
									<td class="bordered">База для исчисления</td>
									<td class="bordered">Ставка</td>
									<td class="bordered">Сумма</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
									<!--td class="bordered">6</td-->
								</tr>
								<xsl:variable name="NumPP" select="PTDEGP:NumPP"/>
								<xsl:for-each select="PTDEGP:HouseShipment">
									<xsl:variable name="party" select="."/>
									<xsl:for-each select="PTDEGP:PaymentDetails">
										<xsl:sort select="PTDEGP:PaymentName" data-type="text" order="ascending"/>
										<tr align="center">
											<td class="bordered">
												<xsl:value-of select="$party/PTDEGP:WayBill/PTDEGP:ObjectOrdinal"/>
											</td>
											<td class="bordered">
												<xsl:value-of select="PTDEGP:PaymentName"/>
											</td>
											<td class="bordered">
												<xsl:if test="PTDEGP:PaymentName != '1010'">
													<xsl:apply-templates mode="base" select="PTDEGP:Rate"/>
												</xsl:if>
											</td>
											<td class="bordered">
												<xsl:choose>
													<xsl:when test="PTDEGP:PaymentName = '1010'">
														<xsl:if test="PTDEGP:FactPaidAmount">
															<xsl:value-of select="translate(translate(format-number(PTDEGP:FactPaidAmount, '#,##0.00'),',',' '),'.',',')"/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates mode="rate" select="PTDEGP:Rate"/>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="bordered">
												<xsl:if test="PTDEGP:FactPaidAmount">
													<xsl:value-of select="translate(translate(format-number(PTDEGP:FactPaidAmount, '#,##0.00'),',',' '),'.',',')"/>
												</xsl:if>
											</td>
										</tr>
										<xsl:if test="($NumPP &gt; 0) and (PTDEGP:PaymentChange[PTDEGP:NumPP = $NumPP])">
											<tr align="center">
												<td class="bordered">
													<xsl:value-of select="$party/PTDEGP:WayBill/PTDEGP:ObjectOrdinal"/>
												</td>
												<td class="bordered">
													<xsl:value-of select="PTDEGP:PaymentName"/>
												</td>
												<td class="bordered"/>
												<td class="bordered"/>
												<td class="bordered">
													<xsl:if test="PTDEGP:PaymentChange[PTDEGP:NumPP = $NumPP]/PTDEGP:DifferencePaymentAmount">
														<xsl:value-of select="translate(translate(format-number(PTDEGP:PaymentChange[PTDEGP:NumPP = $NumPP]/PTDEGP:DifferencePaymentAmount, '#,##0.00'),',',' '),'.',',')"/>
													</xsl:if>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>	
									
									<tr align="center" valign="top">
										<td class="bordered" colspan="4">
											Всего по индивидуальной накладной
										</td>
										<td class="bordered">
											<xsl:if test="PTDEGP:Amount">
												<xsl:value-of select="translate(translate(format-number(PTDEGP:Amount, '#,##0.00'),',',' '),'.',',')"/>
											</xsl:if>
											<br/>
										</td>
									</tr>
								</xsl:for-each>
								<tr align="center" valign="top">
									<td class="bordered" colspan="4">
										Всего таможенных сборов по декларации на товары для экспресс-грузов
									</td>
									<td class="bordered">
										<xsl:if test="PTDEGP:AllSborAmount">
											<xsl:value-of select="translate(translate(format-number(PTDEGP:AllSborAmount, '#,##0.00'),',',' '),'.',',')"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered" colspan="4">
										Всего таможенных пошлин по декларации на товары для экспресс-грузов
									</td>
									<td class="bordered">
										<xsl:if test="PTDEGP:AllDutiesAmount">
											<xsl:value-of select="translate(translate(format-number(PTDEGP:AllDutiesAmount, '#,##0.00'),',',' '),'.',',')"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr valign="top">
									<td class="bordered" colspan="3">
										<div width="100%" align="center">B1. Подробности уплаты (взыскания)</div>
									</td>
								</tr>
								<tr valign="top">
									<td class="bordered" width="25%">Индивидуальная накладная</td>
									<td class="bordered" width="35%">Сведения об уплате</td>
									<td class="bordered" width="40%">Прекращение обязанности</td>
								</tr>
								<xsl:for-each select="PTDEGP:HouseShipment">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="PTDEGP:WayBill/PTDEGP:ObjectOrdinal"/>
											<br/>
											<xsl:text>(ID накладной в реестре: </xsl:text>
											<xsl:value-of select="PTDEGP:WayBill/PTDEGP:WayBillID"/>
											<xsl:text>)</xsl:text>
										</td>
										<td class="bordered">
											<xsl:variable name="INN" select="PTDEGP:INN"/>
											<!--Суммы платежей, подлежащие уплате:<br/>-->
											<xsl:for-each select="PTDEGP:FactPaymentDetails">
												<xsl:sort select="PTDEGP:PaymentName" data-type="text" order="ascending"/>
												<xsl:sort select="PTDEGP:NumPP" data-type="number" order="ascending"/>
												<xsl:if test="position() &gt; 1"><br/></xsl:if>
												<xsl:value-of select="PTDEGP:PaymentName"/>
												<xsl:if test="PTDEGP:WriteOffAmount">
													<xsl:text> - </xsl:text>
													<xsl:value-of select="translate(translate(format-number(PTDEGP:WriteOffAmount, '#,##0.00'),',',' '),'.',',')"/>
												</xsl:if>
												<xsl:if test="$INN">
													<xsl:text> - ИНН </xsl:text>
													<xsl:value-of select="$INN"/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:for-each select="PTDEGP:TerminationOfDuty">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:value-of select="PTDEGP:CustomsTaxModeCode"/>
												<xsl:text> - </xsl:text>
												<xsl:if test="PTDEGP:Amount">
													<xsl:value-of select="translate(translate(format-number(PTDEGP:Amount, '#,##0.00'),',',' '),'.',',')"/>
												</xsl:if>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="PTDEGP:CurrencyN3Code"/>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="PTDEGP:DocumentBase/cat_ru:PrDocumentNumber"/>
												<xsl:text> - </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="PTDEGP:DocumentBase/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
												<xsl:text> - </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="PTDEGP:TerminationOfDutyDate"/>
												</xsl:call-template>
												<xsl:text> - </xsl:text>
												<xsl:value-of select="PTDEGP:CaseCode"/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="25%">
										<xsl:text>Дата</xsl:text>
										<br/>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="PTDEGP:ExecutionDate"/></xsl:call-template>
									</td>
									<td width="75%">
										<xsl:text>Документ об уплате заполнен</xsl:text>
										<br/>
										<xsl:apply-templates select="PTDEGP:CustomsPerson"/>
									</td>
								</tr>
							</tbody>
						</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="PTDEGP:CustomsPerson">
		<xsl:choose>
			<xsl:when test="RUScat_ru:LNP">
				<xsl:value-of select="RUScat_ru:LNP"/>
				<xsl:if test="RUScat_ru:CustomsCode">
					<xsl:text> (код ТО - </xsl:text>
					<xsl:value-of select="RUScat_ru:CustomsCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cat_ru:PersonMiddleName"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template mode="rate" match="PTDEGP:Rate">
		<xsl:choose>
			<xsl:when test="PTDEGP:TaxBaseKind=0">
				<xsl:if test="PTDEGP:RateCost">
					<xsl:value-of select="PTDEGP:RateCost * 100"/>
					<xsl:text> %</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:when test="PTDEGP:TaxBaseKind=1">
				<xsl:if test="PTDEGP:RateWeigh">
					<xsl:value-of select="PTDEGP:RateWeigh"/>
					<xsl:text> евро/кг</xsl:text>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template mode="base" match="PTDEGP:Rate">
		<xsl:choose>
			<xsl:when test="PTDEGP:TaxBaseKind=0">
				<xsl:if test="PTDEGP:OverCost">
					<xsl:value-of select="PTDEGP:OverCost"/>
					<xsl:text> евро</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:when test="PTDEGP:TaxBaseKind=1">
				<xsl:if test="PTDEGP:OverWeighQuantity">
					<xsl:value-of select="PTDEGP:OverWeighQuantity"/>
					<xsl:text> кг</xsl:text>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<!--xsl:template match="*" mode="rate1">
		<xsl:variable name="rateval">
			<xsl:choose>
				<xsl:when test="PTDEGP:Rate or PTDEGP:Rate!=''">
					<xsl:value-of select="PTDEGP:Rate"/>
				</xsl:when>
				<xsl:otherwise> 0 </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="format-number($rateval,'0.######')"/>
		<xsl:choose>
			<xsl:when test="PTDEGP:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="PTDEGP:RateTypeCode!='*' or not(PTDEGP:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="PTDEGP:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="PTDEGP:RateCurrencyCode"/>
						<xsl:if test="PTDEGP:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:value-of select="PTDEGP:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="PTDEGP:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template-->
	
	<xsl:template mode="amount" match="*">
		<xsl:text>Код вида: </xsl:text>
		<xsl:value-of select="PTDEGP:PaymentModeCode"/>
		<xsl:text> Сумма: </xsl:text>
		<xsl:if test="PTDEGP:Amount">
			<xsl:value-of select="translate(translate(format-number(PTDEGP:Amount, '#,##0.00'),',',' '),'.',',')"/>
		</xsl:if>
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
