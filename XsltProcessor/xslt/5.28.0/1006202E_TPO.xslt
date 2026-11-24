<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" 
	xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" 
	xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.28.0" 
	xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" 
	xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" 
	xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" 
	xmlns:tpo="urn:customs.ru:Information:CustomsDocuments:TPO:5.28.0">

	<xsl:param name="NsiValues"/>
	
	<xsl:variable name="has6020" select="count(tpo:TPO/tpo:Goods/tpo:PaymentInfo/tpo:PaymentInfoDetails[tpo:PaymentModeCode = '6020'])"/>
	<xsl:variable name="EDIndicator" select="tpo:TPO/tpo:TPOTypeCode/tpo:EDIndicator"/>
	<xsl:variable name="MP" select="tpo:TPO/tpo:TPOTypeCode/tpo:MovementPurpose"/>
	<xsl:variable name="MW" select="tpo:TPO/tpo:TPOTypeCode/tpo:MovementWay"/>
	<xsl:variable name="TPOSign" select="tpo:TPO/tpo:TPOSign"/>
	<!-- Шаблон для типа TPOType -->
	<xsl:template match="tpo:TPO">
		<xsl:param name="w" select="200"/>
		<xsl:variable name="sheetAmount">
			<xsl:choose>
				<xsl:when test="count(tpo:Goods) = 0 or count(tpo:Goods) = 1">1</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ceiling((count(tpo:Goods) - 1) div 4) + 1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<style>
                  body {
                  font-family: Arial;
                  background: #cccccc;
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
                  
                  table{
					  padding: 0px;
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
                  font-size: 10pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 10pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 10pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }


				 .normal {
					 font-size: 10pt;
				 }
                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  font-size: 8pt;
                  border: solid 1px windowtext;
                  }
                  td.small {
					font-size: 8pt;
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
					<table width="100%" style="padding:0;">
						<tbody>
							<tr>
								<td style="border-right:1px solid black; border-top: 1px solid black; border-left: 1px solid black;" align="center">Таможенный приходный ордер</td>
							</tr>
							<tr>
								<td style="border-right:1px solid black; border-bottom: 1px solid black; border-left: 1px solid black;" align="left">ОСНОВНОЙ ЛИСТ</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" style="padding: 0;">
						<tbody>
							<tr valign="top">
								<td width="50%" class="bordered" style="border-top:0px;">
									<xsl:text>1. Справочный номер</xsl:text>
									<br/>
									<span class="normal">
										<xsl:apply-templates select="tpo:TPORegNumber"/>
										<xsl:if test="tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails]">
											<br/>
											<xsl:apply-templates select="tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails][1]/tpo:CustomsDeclarationIdDetails" mode="gtd_num_3"/>
										</xsl:if>
										<xsl:if test="not(tpo:TPORegNumber) and not(tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails])">-</xsl:if>
									</span>
								</td>
								<td style="border-right: 1px solid black; border-bottom: 1px solid black;">
									<table>
										<tbody>
											<tr>
												<td width="68%" class="small" style="border-right: 1px solid black;">
													<xsl:text>2. Тип ордера</xsl:text>
													<br/>
													<br/>
													<table style="padding: 0; margin: 0;">
														<tbody>
															<tr style="height:24px;" align="center" valign="middle">
																<td width="25%" style="border-right:1px solid black;">
																	<xsl:apply-templates select="tpo:TPOTypeCode/tpo:EDIndicator"/>
																</td>
																<td width="25%" style="border-right:1px solid black;">
																	<xsl:apply-templates select="tpo:TPOTypeCode/tpo:MovementPurpose"/>
																</td>
																<td width="25%" style="border-right:1px solid black;">
																	<xsl:apply-templates select="tpo:TPOTypeCode/tpo:MovementWay"/>
																</td>
																<td width="25%">
																	<xsl:apply-templates select="tpo:TPOTypeCode/tpo:TransportModeCode"/>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td width="32%" class="small">
													<xsl:text>3. Количество листов</xsl:text>
													<br/>
													<br/>
													<table style="padding: 0; margin: 0;">
														<tbody>
															<tr style="height: 24px;" align="center" valign="middle">
																<xsl:choose>
																	<xsl:when test="$EDIndicator = 'ЭД'">
																		<td width="50%" style="border-right: 1px solid black;">-</td>
																		<td width="50%">-</td>
																	</xsl:when>
																	<xsl:otherwise>
																		<td width="50%" style="border-right: 1px solid black;">1</td>
																		<td width="50%">
																			<xsl:value-of select="$sheetAmount"/>
																		</td>
																	</xsl:otherwise>
																</xsl:choose>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td class="bordered" style="border-top:0px; border-bottom:0px">
									<xsl:text>4. Плательщик</xsl:text>
									<table style="padding: 0; margin: 0;">
										<tbody>
											<tr valign="top">
												<td style="border-right: 1px solid black;" width="25%">
													<span class="normal">
														<xsl:choose>
															<xsl:when test="count(tpo:Payer) = 1">
																<xsl:apply-templates select="tpo:Payer" mode="graph4"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="contains('ИМ ИД ИВ', $MP)">
																		<xsl:apply-templates select="tpo:Payer[not(tpo:PayerIndicator) or tpo:PayerIndicator = 1 or (tpo:PayerIndicator = 3 and (tpo:PersonIDIndicator = 1 or translate(substring(tpo:PersonIDIndicator, 1, 1), 't', 'T') = 'T' ))]" mode="graph4"/>
																		<xsl:if test="not(tpo:Payer[not(tpo:PayerIndicator) or tpo:PayerIndicator = 1 or (tpo:PayerIndicator = 3 and (tpo:PersonIDIndicator = 1 or translate(substring(tpo:PersonIDIndicator, 1, 1), 't', 'T') = 'T' ))])">-</xsl:if>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:apply-templates select="tpo:Payer[not(tpo:PayerIndicator) or tpo:PayerIndicator != 3]" mode="graph4"/>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
												<td width="25%">
													<span class="normal">
														<xsl:if test="count(tpo:Payer) &gt; 1">
															<xsl:choose>
																<xsl:when test="contains('ИМ ИД ИВ', $MP)">
																	<xsl:apply-templates select="tpo:Payer[tpo:PayerIndicator = 2]" mode="graph4"/>
																	<xsl:if test="not(tpo:Payer[tpo:PayerIndicator = 2])">-</xsl:if>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:apply-templates select="tpo:Payer[tpo:PayerIndicator != 3]" mode="graph4"/>
																	<xsl:if test="not(tpo:Payer[tpo:PayerIndicator = 3])">-</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:if>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="bordered" style="border-top:0px; border-bottom:0px">
									<table>
										<tbody>
											<tr>
												<td colspan="2" class="small">
													<xsl:text>5. Общая стоимость товаров</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="small" style="border-right:1px solid black;border-bottom:1px solid black;" width="50%">
													<xsl:text>в евро</xsl:text>
													<br/>
													<span class="normal">
														<xsl:choose>
															<xsl:when test="contains('ИМ ИД ИВ ИЮ ЭЮ РЗ', $MP) or not(tpo:EuroTotalCost)">
																<xsl:apply-templates select="tpo:EuroTotalCost" mode="translate_number"/>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text>-</xsl:text>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
												<td class="small" style="border-bottom:1px solid black;" width="50%">
													<xsl:text>в национальной валюте</xsl:text>
													<br/>
													<span class="normal">
														<xsl:choose>
															<xsl:when test="contains('ИМ ИД ИВ ИЮ ЭЮ РЗ', $MP) or not(tpo:EuroTotalCost)">
																<xsl:apply-templates select="tpo:TotalCost" mode="translate_number"/>
															</xsl:when>
															<xsl:otherwise>-</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
											</tr>
											<tr>
												<td class="small" colspan="2">
													<xsl:text>6. Курсы валют</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="small" style="border-right:1px solid black;border-bottom:1px solid black;" width="50%">
													<xsl:text>в евро</xsl:text>
													<br/>
													<span class="normal">
														<xsl:choose>
															<xsl:when test="($MP = 'ПЛ' and tpo:Goods[tpo:GoodsKindCode = 4]) or not(tpo:PaymentCurrency/tpo:CurrencyEuroRate)">-</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="tpo:PaymentCurrency/tpo:CurrencyEuroRate" mode="translate_number"/>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</td>
												<td style="border-bottom:1px solid black;" width="50%">
												</td>
											</tr>
											<tr>
												<td class="small" colspan="2">
													<xsl:text>7. Общий вес товаров (кг)</xsl:text>
													<br/>
													<span class="normal">
														<xsl:apply-templates select="tpo:TotalWeight" mode="translate_number3decimals"/>
														<xsl:if test="not(tpo:TotalWeight)">-</xsl:if>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
									
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
									<xsl:text>8. Дополнительная информация, представленные документы</xsl:text>
									<br/>
									<span class="normal">
										<!--xsl:variable name="graph8"-->
											<xsl:choose>
												<xsl:when test="(not(tpo:AdditionalInformationDetails) or string(tpo:AdditionalInformationDetails) = '')
												and not(tpo:MPONumber) and not(tpo:MPONotifNumber) 
												and not(tpo:MPOPostalTransferNumber) 
												and not(tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber) 
												and not(tpo:UtilCollDetails)">-</xsl:when>
												<xsl:otherwise>
												<xsl:for-each select="tpo:AdditionalInformationDetails">
													<xsl:if test="position()!=1">
														<br/>
													</xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="$MP = 'ИМ' and $MW = 'МП'">
													<br/>
													<xsl:apply-templates select="tpo:MPONumber/tpo:MPO_Number"/>
												</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
									</span>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="contains('ПЛ МА СХ РЕ', $MP)">
									<xsl:call-template name="graph9-17">
										<xsl:with-param name="goods" select="."/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="graph9-17">
										<xsl:with-param name="goods" select="tpo:Goods[1]"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
							
							<tr valign="top">
								<xsl:choose>
									<xsl:when test="contains('ПЛ МА СХ РЕ', $MP)">
										<xsl:comment>graph18 data = tpo:CommonPaymentDetails, count - <xsl:copy-of select="count(tpo:CommonPaymentDetails)"/></xsl:comment>
										<xsl:call-template name="graph18">
											<xsl:with-param name="data" select="tpo:CommonPaymentDetails"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:comment>graph18 data = tpo:Goods[1]</xsl:comment>
										<xsl:call-template name="graph18">
											<xsl:with-param name="data" select="tpo:Goods[1]"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:call-template name="graph19">
									<xsl:with-param name="data" select="."/>
								</xsl:call-template>
							</tr>
							<tr valign="top">
								<td class="bordered small">
									20. Подробности уплаты (взыскания)
									<br/>
									<span class="normal">
										<xsl:apply-templates select="tpo:CommonPaymentDetails/tpo:FactPaymentDetails[tpo:PaymentModeCode != '4XXX']/tpo:PaymentDocDetails[tpo:WriteOffAmount != 0 and (tpo:IsWorked = 1 or translate(substring(tpo:IsWorked, 1, 1), 't', 'T') = 'T')]" mode="graph20"/>
										<xsl:if test="not(tpo:CommonPaymentDetails/tpo:FactPaymentDetails[tpo:PaymentModeCode != '4XXX']/tpo:PaymentDocDetails[tpo:WriteOffAmount != 0] and (tpo:IsWorked = 1 or translate(substring(tpo:IsWorked, 1, 1), 't', 'T') = 'T'))">-</xsl:if>
									</span>
								</td>
								<td class="bordered small">
									21. Прекращение обязанности
									<br/>
									<span class="normal">
										<xsl:choose>
											<xsl:when test="tpo:TPORegNumber/tpo:NumPP and tpo:TPORegNumber/tpo:NumPP != '00' and tpo:TerminationOfDuty">
												<xsl:apply-templates select="tpo:TerminationOfDuty" mode="graph21"/>
											</xsl:when>
											<xsl:otherwise><xsl:text>-</xsl:text></xsl:otherwise>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr>
								<td class="bordered" colspan="2">
									<table width="100%">
										<tbody>
											<tr valign="top">
												<td class="small" width="25%" style="border-right: 1px solid black;">
													22. ТПО заполнен
													<br/>
													<span class="normal">
														<xsl:apply-templates select="tpo:CustomsPersonName" mode="graph22"/>
														<xsl:if test="not(tpo:CustomsPersonName)"/>
													</span>
												</td>
												<td class="small" width="25%" style="border-right: 1px solid black;">
													23. Подпись плательщика
													<br/>
													<span class="normal">
														<xsl:apply-templates select="tpo:Payer[tpo:FactPayerIndicator = 1 or translate(substring(tpo:FactPayerIndicator, 1, 1), 't', 'T') = 'T']" mode="graph23"/>
														<xsl:if test="not(tpo:Payer[tpo:FactPayerIndicator = 1 or translate(substring(tpo:FactPayerIndicator, 1, 1), 't', 'T') = 'T'])">-</xsl:if>
													</span>
												</td>
												<td class="small" width="50%" align="center">
													24. Реквизиты платежа
													<br/>
													<xsl:if test="tpo:BarCode[1]">
														<img src="{tpo:BarCode[1]}" style="width:45mm; height:45mm;display:inline-block;"/>
													</xsl:if>
													<xsl:if test="tpo:BarCode[2]">
														<img src="{tpo:BarCode[2]}" style="width:45mm; height:45mm;display:inline-block;"/>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<xsl:for-each select="tpo:Goods[((position() - 1) mod 4) =  1]">
					<xsl:variable name="goods1" select="."/>
					<xsl:variable name="goods2" select="./following-sibling::tpo:Goods[1]"/>
					<xsl:variable name="goods3" select="./following-sibling::tpo:Goods[2]"/>
					<xsl:variable name="goods4" select="./following-sibling::tpo:Goods[3]"/>
					<div class="page" style="width: {$w}mm;">
						<table width="100%">
							<tbody>
								<tr>
									<td class="bordered" colspan="2">ДОБАВОЧНЫЙ ЛИСТ</td>
								</tr>
								<tr valign="top">
									<td width="50%" class="bordered" style="border-top:0px;">
										<xsl:text>1. Справочный номер</xsl:text>
										<br/>
										<span class="normal">
											<xsl:apply-templates select="./../tpo:TPORegNumber"/>
											<xsl:if test="../tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails]">
												<br/>
												<xsl:apply-templates select="../tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails][1]/tpo:CustomsDeclarationIdDetails" mode="gtd_num_3"/>
											</xsl:if>
											<xsl:if test="not(../TPORegNumber) and not(../tpo:AdditionalInformationDetails/tpo:PreviousDocDocDetails[tpo:CRPreviousCustomsDocCode = 2 and tpo:CustomsDeclarationIdDetails])">-</xsl:if>
										</span>
									</td>
									<td style="border-right: 1px solid black; border-bottom: 1px solid black;">
										<table>
											<tbody>
												<tr>
													<td width="68%" class="small" style="border-right: 1px solid black;">
													</td>
													<td width="32%" class="small">
														<xsl:text>3. Количество листов</xsl:text>
														<br/>
														<br/>
														<table style="padding: 0; margin: 0;">
															<tbody>
																<tr style="height: 24px;" align="center" valign="middle">
																	<xsl:choose>
																		<xsl:when test="$EDIndicator = 'ЭД'">
																			<td width="50%" style="border-right: 1px solid black;">-</td>
																			<td width="50%">-</td>
																		</xsl:when>
																		<xsl:otherwise>
																			<td width="50%" style="border-right: 1px solid black;">
																				<xsl:value-of select="ceiling(position() div 4) + 1"/>
																			</td>
																			<td width="50%">
																				<xsl:value-of select="$sheetAmount"/>
																			</td>
																		</xsl:otherwise>
																	</xsl:choose>
																	
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								
								<xsl:call-template name="graph9-17">
									<xsl:with-param name="goods" select="$goods1"/>
								</xsl:call-template>
								<xsl:call-template name="graph9-17">
									<xsl:with-param name="goods" select="$goods2"/>
								</xsl:call-template>
								<xsl:call-template name="graph9-17">
									<xsl:with-param name="goods" select="$goods3"/>
								</xsl:call-template>
								<xsl:call-template name="graph9-17">
									<xsl:with-param name="goods" select="$goods4"/>
								</xsl:call-template>
								
								<tr valign="top">
									<xsl:call-template name="graph18">
										<xsl:with-param name="data" select="$goods1"/>
									</xsl:call-template>
									<xsl:call-template name="graph18">
										<xsl:with-param name="data" select="$goods2"/>
									</xsl:call-template>
								</tr>
								<tr valign="top">
									<xsl:call-template name="graph18">
										<xsl:with-param name="data" select="$goods3"/>
									</xsl:call-template>
									<xsl:call-template name="graph18">
										<xsl:with-param name="data" select="$goods4"/>
									</xsl:call-template>
								</tr>
								<tr valign="top">
									<td class="bordered">
										22. ТПО заполнен
										<br/>
										<span class="normal">
											<xsl:apply-templates select="../tpo:CustomsPersonName" mode="graph22"/>
										</span>
									</td>
									<td class="bordered">
										23. Подпись плательщика
										<br/>
										<span class="normal">
											<xsl:apply-templates select="../tpo:Payer[tpo:FactPayerIndicator = 1 or translate(substring(tpo:FactPayerIndicator, 1, 1), 't', 'T') = 'T']" mode="graph23"/>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:for-each>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="isInSet">
		<xsl:param name="testVal"/>
		<xsl:choose>
			<xsl:when test="contains($testVal, .)">T</xsl:when>
			<xsl:otherwise>F</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="isInSet">
		<xsl:param name="testVal"/>
		<xsl:choose>
			<xsl:when test="contains($testVal, $MP)">T</xsl:when>
			<xsl:otherwise>F</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="isInCustomSet">
		<xsl:param name="val"/>
		<xsl:param name="testVal"/>
		<xsl:choose>
			<xsl:when test="contains($testVal, $val)">T</xsl:when>
			<xsl:otherwise>F</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="noData">
		<xsl:choose>
			<xsl:when test="."><xsl:apply-templates select="."/></xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="tpo:Payer" mode="graph23">
		<xsl:apply-templates select="tpo:PayerName"/>
		<xsl:apply-templates select="tpo:Person/*" mode="separated"/>
	</xsl:template>
	
	<xsl:template match="tpo:CustomsPersonName" mode="graph22">
		<xsl:if test="tpo:LNP">
			<xsl:apply-templates select="tpo:LNP"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="tpo:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="tpo:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="tpo:PersonMiddleName"/>
	</xsl:template>
	
	<xsl:template match="tpo:TerminationOfDuty" mode="graph21">
		<xsl:if test="position() !=1"><br/></xsl:if>
		<xsl:apply-templates select="tpo:CustomsTaxModeCode"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:Amount" mode="translate_number2decimals"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:CurrencyN3Code"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:DocumentBase/cat_ru:PrDocumentNumber"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:DocumentBase/cat_ru:PrDocumentDate" mode="russian_date"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:TerminationOfDutyDate" mode="russian_date"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:CaseCode"/>
	</xsl:template>
	
	<xsl:template match="*" mode="graph20">
		<xsl:if test="position()!=1"><br/></xsl:if>
		<xsl:apply-templates select="../tpo:PaymentModeCode"/><!-- элемент 1 -->
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="tpo:WriteOffAmount" mode="translate_number2decimals"/><!-- элемент 2 -->
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="../tpo:CurrencyN3Code"/><!-- элемент 3 -->
		<xsl:text>-</xsl:text>
		<xsl:text></xsl:text><!-- элемент 4 -->
		<xsl:text>-</xsl:text>
		<xsl:text></xsl:text><!-- элемент 5 -->
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="." mode="graph20element6"/><!-- элемент 6 -->
		<!--xsl:text>-</xsl:text>
		<xsl:text></xsl:text--><!-- элемент 7 -->
	</xsl:template>
	
	<xsl:template match="*" mode="graph20element6">
		<xsl:choose>
			<xsl:when test="tpo:TaxpayerINN"><xsl:apply-templates select="tpo:TaxpayerINN"/></xsl:when>
			<xsl:when test="tpo:UITN"><xsl:apply-templates select="tpo:UITN/RUScat_ru:UITNCode"/></xsl:when>
			<xsl:when test="tpo:PersonId"><xsl:apply-templates select="tpo:PersonId"/></xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="tpo:AdditionalInformationDetails">
		<xsl:if test="tpo:CRTaxAllowanceCode">
			<xsl:text>Признак наличия льготы: </xsl:text>
			<xsl:value-of select="tpo:CRTaxAllowanceCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="tpo:PresentedDocument">
			<br/>
			<xsl:for-each select="tpo:PresentedDocument">
				<xsl:if test="position()!=1"><br/></xsl:if>
				<xsl:apply-templates mode="docSlash" select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="tpo:PreviousDocDocDetails">
			<xsl:for-each select="tpo:PreviousDocDocDetails">
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="tpo:AdditionalInfoText">
			<br/>
			<xsl:apply-templates select="tpo:AdditionalInfoText"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="tpo:PreviousDocDocDetails">
		<xsl:if test="tpo:CustomsReceiptIdDetails">
			<br/>
			<xsl:apply-templates mode="reg_num" select="tpo:CustomsReceiptIdDetails"/>
		</xsl:if>
		<xsl:if test="tpo:CustomsDeclarationIdDetails">
			<br/>
			<xsl:apply-templates mode="reg_num" select="tpo:CustomsDeclarationIdDetails"/>
		</xsl:if>
		<xsl:if test="tpo:RegUtil">
			<br/>
			<xsl:apply-templates select="tpo:PresentedDocumentModeCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates mode="docSlashY2" select="tpo:RegUtil"/>
		</xsl:if>
		<xsl:if test="tpo:OtherDocDetails">
			<br/>
			<xsl:apply-templates select="tpo:PresentedDocumentModeCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="tpo:OtherDocDetails/cat_ru:PrDocumentNumber"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="tpo:OtherDocDetails/cat_ru:PrDocumentDate" mode="russian_dateY2"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="docSlashY2">
		<xsl:apply-templates select="tpo:PresentedDocumentModeCode"/>
		<xsl:if test="tpo:PresentedDocumentModeCode"><xsl:text>/</xsl:text></xsl:if>
		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="tpo:PresentedDocumentModeCode or cat_ru:PrDocumentNumber"><xsl:text>/</xsl:text></xsl:if>
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_dateY2"/>
	</xsl:template>
	<xsl:template match="*" mode="docSlash">
		<xsl:apply-templates select="tpo:PresentedDocumentModeCode"/>
		<xsl:if test="tpo:PresentedDocumentModeCode"><xsl:text>/</xsl:text></xsl:if>
		<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="tpo:PresentedDocumentModeCode or cat_ru:PrDocumentNumber"><xsl:text>/</xsl:text></xsl:if>
		<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:if test="tpo:PresentedDocumentModeCode">
			<xsl:value-of select="tpo:PresentedDocumentModeCode"/>
			<xsl:text>:</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[position()=1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position()=2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position()=3]"/>
	</xsl:template>
	
	<xsl:template name="graph18">
		<xsl:param name="data"/>
		<xsl:comment>graph18 data = <xsl:value-of select="local-name($data)"/></xsl:comment>
		<td class="bordered" width="50%">
			<table width="100%">
				<tbody>
					<tr>
						<td style="border-bottom: 1px solid black;" colspan="4" class="small">18. Исчисление платежей</td>
					</tr>
					<tr>
						<td class="small">
							<table>
								<tbody>
									<xsl:call-template name="graph1819title"/>
									<xsl:choose>
										<xsl:when test="contains('МА СХ РЕ ПЛ', $MP)">
											<xsl:choose>
												<xsl:when test="$MP = 'ПЛ' and ($TPOSign = '1' or $TPOSign = '2')">
													<xsl:apply-templates select="$data/tpo:CustomsTaxModeCodeDetails" mode="graph18data"/>
												</xsl:when>
												<xsl:when test="contains('МА СХ РЕ', $MP) or ($MP = 'ПЛ' and ($TPOSign = '3' or $TPOSign = '4' or $TPOSign = '9'))">
													<xsl:comment>PaymentDetails count - <xsl:value-of select="count($data/tpo:PaymentDetails)"/></xsl:comment>
													<xsl:apply-templates select="$data/tpo:PaymentDetails" mode="graph18data"/>
												</xsl:when>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="$data/tpo:PaymentInfo/tpo:PaymentInfoDetails[substring(tpo:PaymentModeCode, 4, 1) != '1' and substring(tpo:PaymentModeCode, 4, 1) != '2']" mode="graph18data"/>
											<xsl:apply-templates select="$data/tpo:PaymentInfo/tpo:PaymentInfoDetails[substring(tpo:PaymentModeCode, 4, 1) = '1' or substring(tpo:PaymentModeCode, 4, 1) = '2']" mode="graph18data"/>
										</xsl:otherwise>
									</xsl:choose>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	</xsl:template>
	
	<xsl:template match="*" mode="graph18data">
		<xsl:comment>Текущий узел для строки в гр.18: <xsl:value-of select="local-name()"/></xsl:comment>
		<xsl:variable name="borderBottom">
			<!--xsl:if test="position() != last()">border-bottom: 1px solid black;</xsl:if-->
		</xsl:variable>
		<xsl:variable name="PMC_last" select="substring(tpo:PaymentModeCode, 4, 1)"/>
		<xsl:comment><xsl:value-of select="local-name(.)"/></xsl:comment>
		<xsl:comment>$MP = <xsl:value-of select="$MP"/></xsl:comment>
		<xsl:choose>
			<xsl:when test="contains('ИМ ИВ ИЮ ЭЮ УС АК ДЗ', $MP)">
				<tr valign="top" align="left">
					<td class="small" style="{$borderBottom}border-right: 1px solid black">
						<xsl:variable name="pmc" select="tpo:PaymentModeCode"/>
						<xsl:choose>
							<xsl:when test="($has6020 &gt; 0) and not(contains('1010 6020', string(tpo:PaymentModeCode)))">
								<!--xsl:apply-templates select="tpo:PaymentModeCode"/-->
							</xsl:when>
							<!--xsl:when test="not(preceding-sibling::tpo:PaymentModeCode = $pmc)"/-->
							<xsl:otherwise>
								<xsl:apply-templates select="tpo:PaymentModeCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="right">
						<xsl:choose>
							<xsl:when test="not(tpo:PaymentModeCode = '1010' and tpo:TaxBase = '1')">
								<xsl:choose>
									<xsl:when test="tpo:TaxBaseQualifierCode and contains('162,163,166,168,117,185,841,845,852,852,861,863,865,867', tpo:TaxBaseQualifierCode)">
										<xsl:apply-templates select="tpo:TaxBase" mode="translate_number6decimals"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="tpo:TaxBase" mode="translate_number2decimals"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="left">
						<xsl:choose>
							<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateValue"> <!-- Rate1 -->
								<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="$PMC_last = '1' or $PMC_last = '2'">
										<xsl:text>%</xsl:text>
										<xsl:text> / </xsl:text>
										<xsl:choose>
											<xsl:when test="tpo:RefinanceRate">
												<xsl:apply-templates select="tpo:RefinanceRate"/>
											</xsl:when>
											<xsl:when test="../../../tpo:ShareRefinance[1]/tpo:ShareRefinanceRate">
												<xsl:apply-templates select="../../../tpo:ShareRefinance[1]/tpo:ShareRefinanceRate"/>
											</xsl:when>
											<xsl:when test="../../../tpo:CommonPaymentDetails/tpo:CustomsTaxModeCodeDetails/tpo:ShareRefinanceRate">
												<xsl:apply-templates select="../../../tpo:CommonPaymentDetails/tpo:CustomsTaxModeCodeDetails/tpo:ShareRefinanceRate"/>
											</xsl:when>
											<xsl:otherwise> 360 </xsl:otherwise>
										</xsl:choose>
										<xsl:text> x </xsl:text>
										<xsl:apply-templates select="tpo:DayQuantity"/>
									</xsl:when>
									<xsl:when test="tpo:PaymentModeCode = '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateValue"> RUB</xsl:when>
									<xsl:when test="tpo:PaymentModeCode != '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%'">%</xsl:when>
									<xsl:when test="tpo:PaymentModeCode != '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*'">
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="tpo:RateDetails/tpo:UnifiedCurrencyN3Code">
												<xsl:apply-templates select="tpo:RateDetails/tpo:UnifiedCurrencyN3Code" mode="currency"/>
											</xsl:when>
											<xsl:otherwise> RUB</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="tpo:RateDetails/tpo:RateQualifierCode">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="tpo:RateDetails/tpo:RateQualifierCode" mode="qualCode"/>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</xsl:when>
							<!-- Rate2 и Rate3 -->
							<!--xsl:when test="tpo:RateDetails/tpo:Rate2 or tpo:RateDetails/tpo:Rate3"> 
								<xsl:choose>
									<xsl:when test="tpo:RateDetails/*[local-name() = 'RateTypeCode2' or local-name() = 'RateTypeCode3'][1] = '%'">%</xsl:when>
									<xsl:when test="tpo:RateDetails/*[local-name() = 'RateTypeCode2' or local-name() = 'RateTypeCode3'][1] = '*'">
										<xsl:text> </xsl:text>
										<xsl:choose>
											<xsl:when test="RateDetails/*[local-name() = 'RateCurrencyCode2' or local-name() = 'RateCurrencyCode3']">
												<xsl:apply-templates select="RateDetails/*[local-name() = 'RateCurrencyCode2' or local-name() = 'RateCurrencyCode3'][1]" mode="currency"/>
											</xsl:when>
											<xsl:when test="tpo:RateDetails/*[local-name() = 'RateTNVEDQualifierCode2' or local-name() = 'RateTNVEDQualifierCode3']">
												<xsl:apply-templates select="tpo:RateDetails/*[local-name() = 'RateTNVEDQualifierCode2' or local-name() = 'RateTNVEDQualifierCode3'][1]" mode="currency"/>
											</xsl:when>
											<xsl:otherwise> RUB.</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="tpo:TaxBaseQualifierCode">
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="tpo:TaxBaseQualifierCode" mode="currency"/>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</xsl:when-->
						</xsl:choose>
					</td>
					<td class="small" style="{$borderBottom}" align="right">
						<xsl:apply-templates select="tpo:CAPaymentAmount" mode="translate_number2decimals"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="contains('ИД РЗ', $MP) and not((tpo:PaymentForeignSign = 1 or translate(substring(tpo:PaymentForeignSign, 1, 1), 't', 'T') = 'T') and tpo:CACurrencyCode != 'RUB')">
				<tr valign="top" align="left">
					<td class="small" style="{$borderBottom}border-right: 1px solid black">
						<xsl:apply-templates select="tpo:PaymentModeCode"/>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="right">
						<xsl:choose>
							<xsl:when test="tpo:TaxBaseQualifierCode and contains('162,163,166,168,117,185,841,845,852,852,861,863,865,867', tpo:TaxBaseQualifierCode)">
								<xsl:apply-templates select="tpo:TaxBase" mode="translate_number6decimals"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="tpo:TaxBase" mode="translate_number2decimals"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="left">
						<xsl:value-of select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
						<xsl:text> </xsl:text>
						<xsl:choose>
							<xsl:when test="tpo:PaymentModeCode = '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateValue"> RUB</xsl:when>
							<xsl:when test="tpo:PaymentModeCode != '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='%' and tpo:RateDetails/tpo:DutyTaxFeeRateValue">%</xsl:when>
							<xsl:when test="tpo:PaymentModeCode != '1010' and tpo:RateDetails/tpo:DutyTaxFeeRateKindCode='*' and tpo:RateDetails/tpo:DutyTaxFeeRateValue">
								<xsl:choose>
									<xsl:when test="tpo:RateDetails/tpo:UnifiedCurrencyN3Code">
										<xsl:apply-templates select="tpo:RateDetails/tpo:UnifiedCurrencyN3Code" mode="currency"/>
									</xsl:when>
									<!--xsl:when test="tpo:RateDetails/tpo:RateQualifierCode">
										<xsl:apply-templates select="tpo:RateDetails/tpo:RateQualifierCode" mode="currency"/>
									</xsl:when-->
									<xsl:otherwise> RUB</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="tpo:RateDetails/tpo:RateQualifierCode">
									<xsl:text>/</xsl:text>
									<xsl:apply-templates select="tpo:RateDetails/tpo:RateQualifierCode" mode="qualCode"/>
								</xsl:if>
							</xsl:when>
						</xsl:choose>
					</td>
					<td class="small" style="{$borderBottom}" align="right">
						<xsl:if test="tpo:OrdinalLineNumber = 2">-</xsl:if>
						<xsl:apply-templates select="tpo:CAPaymentAmount" mode="translate_number2decimals"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="$MP = 'ПЛ' and ($TPOSign = '1' or $TPOSign = '2')">
				<tr valign="top" align="left">
					<td class="small" style="{$borderBottom}border-right: 1px solid black">
						<xsl:apply-templates select="tpo:CustomsTaxModeCode"/>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="right">
						<xsl:apply-templates select="tpo:TaxBase" mode="translate_number2decimals"/>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="left">
						<xsl:apply-templates select="tpo:RefinanceRate"/>
						<xsl:text>%</xsl:text>
						<xsl:text> / </xsl:text>
						<xsl:choose>
							<xsl:when test="tpo:ShareRefinanceRate">
								<xsl:apply-templates select="tpo:ShareRefinanceRate"/>
							</xsl:when>
							<xsl:when test="../../tpo:ShareRefinance[1]/tpo:ShareRefinanceRate">
								<xsl:apply-templates select="../../tpo:ShareRefinance[1]/tpo:ShareRefinanceRate"/>
							</xsl:when>
							<xsl:otherwise> 360 </xsl:otherwise>
						</xsl:choose>
						<xsl:text> x </xsl:text>
						<xsl:apply-templates select="tpo:DayQuantity"/>
					</td>
					<td class="small" style="{$borderBottom}" align="right">
						<xsl:apply-templates select="tpo:Amount" mode="translate_number2decimals"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="contains('МА СХ РЕ', $MP) or ($MP = 'ПЛ' and ($TPOSign = '3' or $TPOSign = '4' or $TPOSign = '9'))">
				<tr valign="top" align="left">
					<td class="small" style="{$borderBottom}border-right: 1px solid black">
						<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black"  align="right">
						<xsl:apply-templates select="tpo:TaxBase" mode="translate_number2decimals"/>
					</td>
					<td class="small" style="{$borderBottom}border-right: 1px solid black" align="left">
						<xsl:choose>
							<xsl:when test="$MP = 'ПЛ' and $TPOSign = '4'">
								<xsl:comment><xsl:value-of select="local-name(../..)"/></xsl:comment>
								<xsl:apply-templates select="../../tpo:NoGoodsDetails/tpo:FixRate"/>
								<xsl:text> RUB</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="tpo:RateDetails/tpo:DutyTaxFeeRateValue"/>
								<xsl:choose>
									<xsl:when test="tpo:RateDetails/tpo:DutyTaxFeeRateKindCode = '%'">%</xsl:when>
									<xsl:otherwise>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="tpo:RateDetails/tpo:UnifiedCurrencyN3Code" mode="currency"/>
										<xsl:if test="tpo:RateDetails/tpo:UnifiedCurrencyN3Code and tpo:RateDetails/tpo:RateQualifierCode">
											<xsl:text>/</xsl:text>
										</xsl:if>	
										<xsl:apply-templates select="tpo:RateDetails/tpo:RateQualifierCode" mode="qualCode"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						
					</td>
					<td class="small" style="{$borderBottom}" align="right">
						<xsl:apply-templates select="catESAD_cu:PaymentAmount" mode="translate_number2decimals"/>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="graph19">
		<xsl:param name="data"/>
		<xsl:comment>ГР.19 data <xsl:value-of select="local-name($data)"/></xsl:comment>
		<td class="bordered" width="50%">
			<table width="100%">
				<tbody>
					<tr>
						<td style="border-bottom: 1px solid black;" colspan="4" class="small">19. Общая сумма, подлежащая уплате (взысканию)</td>
					</tr>
					<tr>
						<td class="small">
							<table>
								<tbody>
									<xsl:call-template name="graph1819title"/>
									<xsl:choose>
										<xsl:when test="$MP = 'ПЛ' and ($TPOSign = '1' or $TPOSign = '2')">
											<xsl:apply-templates select="$data/tpo:CommonPaymentDetails/tpo:FactPaymentDetails[tpo:PaymentModeCode != '4XXX']" mode="graph19data"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="$data/tpo:CommonPaymentDetails/tpo:CustomsTaxModeCodeDetails[tpo:CustomsTaxModeCode != '4XXX']" mode="graph19data"/>
										</xsl:otherwise>
									</xsl:choose>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	</xsl:template>
	
	<xsl:template match="*" mode="graph19data">
		<xsl:variable name="borderBottom">
			<!--xsl:if test="position() != last()">border-bottom: 1px solid black;</xsl:if-->
		</xsl:variable>
		<tr valign="top" align="left">
			<td class="small" style="{$borderBottom}border-right: 1px solid black">
				<xsl:apply-templates select="tpo:CustomsTaxModeCode|tpo:PaymentModeCode"/> <!-- второй вариант - ПЛ и Sign = 1 или 2 -->
			</td>
			<td class="small" style="{$borderBottom}border-right: 1px solid black">
				<!--xsl:apply-templates select="tpo:TaxBase"/-->
				<!--xsl:text> </xsl:text>
				<xsl:apply-templates select="tpo:TaxBaseQualifierCode"/-->
			</td>
			<td class="small" style="{$borderBottom}border-right: 1px solid black">
				<!--xsl:apply-templates select="*[name() = 'tpo:ShareRefinanceRate' or name() = 'tpo:RefinanceRate' or name() = 'tpo:DayQuantity']" mode="separated"><xsl:with-param name="separator" select="'*'"/></xsl:apply-templates-->			
			</td>
			<td class="small" style="{$borderBottom}" align="right">
				<!--xsl:apply-templates select="tpo:Amount|tpo:WriteOffAmount" mode="translate_number2decimals"/--> <!-- было -->
				<xsl:apply-templates select="tpo:Amount|tpo:PaymentAmount" mode="translate_number2decimals"/> <!-- второй вариант - ПЛ и Sign = 1 или 2 -->
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template name="graph1819title">
		<tr valign="top" align="center">
			<td class="small" style="border-bottom: 1px solid black;border-right: 1px solid black">Вид</td>
			<td class="small" style="border-bottom: 1px solid black;border-right: 1px solid black">База для исчисления</td>
			<td class="small" style="border-bottom: 1px solid black;border-right: 1px solid black">Ставка</td>
			<td class="small" style="border-bottom: 1px solid black;">Сумма</td>
		</tr>
	</xsl:template>

	<xsl:template name="graph9-17">
		<xsl:param name="goods"/>
		<xsl:variable name="TNVED4" select="substring($goods/tpo:GoodsTNVEDCode, 1, 4)"/>
		<xsl:variable name="goods_Magadan" select="$goods/tpo:Goods[1]"/><!-- для Магадана - $goods = корневой элемент tpo:TPO (так как ПЛ), поэтому берем первый элемент Goods -->
		<tr valign="top">
			<td width="50%" class="bordered">
				<table>
					<tbody>
						<tr valign="top">
							<td width="70%" rowspan="2" class="small">
								<xsl:text>9.Описание товара</xsl:text>
							</td>
							<td width="30%" colspan="2" class="small" style="border-left: 1px solid black;">
								<xsl:text>10. Номер товара</xsl:text>
							</td>
						</tr>
						<tr>
							<td width="15%" class="small" style="border-left:1px solid black; border-right:1px solid black; border-bottom: 1px solid black;">
								<xsl:choose>
									<xsl:when test="not($goods/tpo:GoodsNumber|$goods_Magadan/tpo:GoodsNumber) or contains('МА СХ', $MP)">-</xsl:when><!-- было: contains('МА ПЛ СХ', $MP) -->
									<xsl:otherwise><xsl:apply-templates select="$goods/tpo:GoodsNumber|$goods_Magadan/tpo:GoodsNumber"/></xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="15%" class="small" style="border-bottom: 1px solid black;">
								<xsl:choose>
									<xsl:when test="not($goods/tpo:GoodsMovementWay|$goods_Magadan/tpo:GoodsMovementWay) or string-length($MW) != 0 or contains('МА СХ', $MP)">-</xsl:when><!-- было: contains('МА ПЛ СХ', $MP) -->
									<xsl:otherwise><xsl:apply-templates select="$goods/tpo:GoodsMovementWay|$goods_Magadan/tpo:GoodsMovementWay"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="normal" colspan="3"> <!-- гр.9 - собственно, описание товара -->
								<span class="normal">
										<xsl:if test="contains('ИМ ИД ИВ', $MP)">
											<xsl:choose>
												<xsl:when test="$goods/tpo:GoodsKindCode = 1">
													<xsl:if test="$goods/tpo:GoodsDescription or $goods/tpo:AddGoodsDescriptionDetails or $goods/tpo:OriginCountryCode">
														<xsl:text>1. </xsl:text><xsl:apply-templates select="$goods/tpo:GoodsDescription"/>
														<xsl:if test="$goods/tpo:OriginCountryCode">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="$goods/tpo:OriginCountryCode"/>
														</xsl:if>
														<xsl:if test="$goods/tpo:AddGoodsDescriptionDetails">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="$goods/tpo:AddGoodsDescriptionDetails"/>
														</xsl:if>
													</xsl:if>
													<xsl:if test="$goods/tpo:AdditionalInformation">
														<br/>
														<xsl:text>2. </xsl:text><xsl:apply-templates select="$goods/tpo:AdditionalInformation"/>
													</xsl:if>
													<xsl:if test="contains('8702 8703 8704 8711', $TNVED4)">
														<xsl:if test="$goods/tpo:AutomobileInfo">
															<br/>
															<xsl:text>3. </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo"/>
														</xsl:if>
													</xsl:if>
												</xsl:when>
												<xsl:when test="$goods/tpo:GoodsKindCode = 2">
													<xsl:if test="$goods/tpo:CategoryGoodsDetails">
														<xsl:text>1.</xsl:text>
													</xsl:if>
													<xsl:for-each select="$goods/tpo:CategoryGoodsDetails">
														<br/>
														<xsl:apply-templates select="tpo:CategoryGoodsTNVEDCode" mode="subString">
															<xsl:with-param name="start" select="'1'"/>
															<xsl:with-param name="end" select="'4'"/>
														</xsl:apply-templates>
														<xsl:if test="tpo:CategoryGoodsDescription">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="tpo:CategoryGoodsDescription"/>
														</xsl:if>
														<xsl:if test="tpo:CategoryGoodsNetWeight">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="tpo:CategoryGoodsNetWeight"/>
															<xsl:text> КГ</xsl:text>
														</xsl:if>
														<xsl:if test="tpo:CategorySupplementaryQuantity">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="tpo:CategorySupplementaryQuantity" mode="quantity"/>
														</xsl:if>
														<xsl:if test="tpo:CategoryContractCost">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="tpo:CategoryContractCost/RUScat_ru:Amount"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="tpo:CategoryContractCost/RUScat_ru:CurrencyCode"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="$goods/tpo:GoodsKindCode = 3">
													<xsl:if test="$goods/tpo:GoodsTNVEDCode or $goods/tpo:GoodsDescription or goods/tpo:SupplementaryQuantity or $goods/tpo:ContractCost">
														<xsl:text>1. </xsl:text>
														<xsl:apply-templates select="$goods/tpo:GoodsTNVEDCode" mode="subString">
															<xsl:with-param name="start" select="'1'"/>
															<xsl:with-param name="end" select="'4'"/>
														</xsl:apply-templates>
														<xsl:if test="$goods/tpo:GoodsDescription">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="$goods/tpo:GoodsDescription"/>
														</xsl:if>
														<xsl:if test="$goods/tpo:SupplementaryQuantity">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="$goods/tpo:SupplementaryQuantity" mode="quantity"/>
														</xsl:if>
														<xsl:if test="$goods/tpo:ContractCost">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="$goods/tpo:ContractCost/RUScat_ru:Amount"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="$goods/tpo:ContractCost/RUScat_ru:CurrencyCode" mode="currency"/>
														</xsl:if>
													</xsl:if>
													<xsl:if test="$TNVED4 != '' and contains('8702 8703 8704 8711', $TNVED4)">
														<xsl:if test="$goods/tpo:AutomobileInfo">
															<br/>
															<xsl:text>2. </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo"/>
														</xsl:if>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="contains('ИЮ ЭЮ РЗ', $MP)">
											<xsl:if test="$goods/tpo:GoodsDescription or $goods/tpo:AddGoodsDescriptionDetails or $goods/tpo:OriginCountryCode">
												<xsl:text>1. </xsl:text><xsl:apply-templates select="$goods/tpo:GoodsDescription"/>
												<xsl:if test="$goods/tpo:OriginCountryCode">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="$goods/tpo:OriginCountryCode"/>
												</xsl:if>
												<xsl:if test="$goods/tpo:AddGoodsDescriptionDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="$goods/tpo:AddGoodsDescriptionDetails"/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="$goods/tpo:AutomobileInfo">
												<br/>
												<xsl:text>2. </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo"/>
												<xsl:if test="$goods/tpo:AutomobileInfo/tpo:VehicleRegistrationDetails/tpo:TransportPassportID">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:VehicleRegistrationDetails/tpo:TransportPassportID" mode="separated"/>
												</xsl:if>
												<xsl:if test="$goods/tpo:TobaccoDetails/tpo:SeasonalMultiplier">
													<br/>
													<xsl:text>Применен сезонный коэффициент = </xsl:text>
													<xsl:apply-templates select="$goods/tpo:TobaccoDetails/tpo:SeasonalMultiplier"/>
												</xsl:if>
											</xsl:if>
										</xsl:if>
										<xsl:if test="$MP = 'УС'">
											<xsl:text>1. </xsl:text><xsl:apply-templates select="$goods/tpo:UtilCollDetails/tpo:Sign"/>
											<xsl:if test="$goods/tpo:AutomobileInfo/tpo:VINID or $goods/tpo:AutomobileInfo/tpo:VINChassisID or $goods/tpo:AutomobileInfo/tpo:VINBodyID">
												<br/>
												<xsl:text>2. </xsl:text>
												<xsl:for-each select="$goods/tpo:AutomobileInfo/*[local-name() = 'VINID' or local-name() = 'VINChassisID' or local-name() = 'VINBodyID']">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:choose>
														<xsl:when test="local-name() = 'VINID'">
															<xsl:choose>
																<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'К'"> VIN: </xsl:when>
																<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'С'"> PIN: </xsl:when>
															</xsl:choose>
														</xsl:when>
														<xsl:when test="local-name() = 'VINChassisID'"> Номер шасси: </xsl:when>
														<xsl:when test="local-name() = 'VINBodyID'"> Номер кузова: </xsl:when>
													</xsl:choose>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="$goods/tpo:AutomobileInfo/tpo:Mark">
												<br/>
												<xsl:text>3. Марка: </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:Mark"/>
											</xsl:if>
											<xsl:if test="$goods/tpo:AutomobileInfo/tpo:Model ">
												<br/>
												<xsl:text>4. Модель: </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:Model "/>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="$goods/tpo:UtilCollDetails[tpo:ChassisOrTrailerCode]/tpo:ChassisOrTrailer/*[contains(local-name(),'Manufact')]">
													<br/>
													<xsl:text>5. Дата выпуска </xsl:text>
													<xsl:apply-templates select="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailer" mode="manufactureDateMY"/>
												</xsl:when>
												<xsl:when test="$goods/tpo:AutomobileInfo/*[contains(local-name(), 'Manufact')]">
													<br/>
													<xsl:text>5. Дата выпуска </xsl:text>
													<xsl:apply-templates select="$goods/tpo:AutomobileInfo" mode="manufactureDateMY"/>
												</xsl:when>
											</xsl:choose>
											<xsl:if test="$goods/tpo:AutomobileInfo/tpo:TransportCategoryCode or $goods/tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode">
												<br/>
												<xsl:text>6. </xsl:text>
												<xsl:choose>
													<xsl:when test="$goods/tpo:UtilCollDetails[tpo:ChassisOrTrailerCode = 1 or tpo:ChassisOrTrailerCode = 2]">
														<xsl:text> Категория ТС: </xsl:text>
														<xsl:value-of select="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TransportCategoryCode"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:choose>
															<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'К'"> Категория ТС: </xsl:when>
															<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'С'"> Вид: </xsl:when>
														</xsl:choose>
														<xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:TransportCategoryCode"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailerCode =  2">
													<br/>
													<xsl:text>7. ОТСУТСТВУЕТ</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'К' and $goods/tpo:AutomobileInfo/tpo:EngineVolumeQuanity">
															<br/><xsl:text>7. Рабочий объем двигателя: </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:EngineVolumeQuanity"/><xsl:text> куб. см.</xsl:text>
														</xsl:when>
														<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'С' and $goods/tpo:AutomobileInfo/tpo:Engine[tpo:EnginePowerHpQuanity or tpo:EnginePowerKvtQuanity]">
															<br/><xsl:text>7. Мощность силовой установки: </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:Engine[tpo:EnginePowerHpQuanity or tpo:EnginePowerKvtQuanity][1]" mode="engineKWtOrHP"/>
														</xsl:when>
														<!--xsl:otherwise>
															<xsl:text> ОТСУТСТВУЕТ</xsl:text>
														</xsl:otherwise-->
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailerCode =  2">
													<br/>
													<xsl:text>8. ОТСУТСТВУЕТ</xsl:text>
												</xsl:when>
												<xsl:when test="$goods/tpo:AutomobileInfo/tpo:EngineModel or $goods/tpo:AutomobileInfo/tpo:EngineId">
													<br/>
													<xsl:text>8. </xsl:text>
														<xsl:if test="$goods/tpo:AutomobileInfo/tpo:Engine/tpo:EngineModel">
															<xsl:text>Модель: </xsl:text>
																<xsl:for-each select="$goods/tpo:AutomobileInfo/tpo:Engine/tpo:EngineModel">
																	<xsl:if test="position()!=1">, </xsl:if>
																	<xsl:apply-templates select="."/>
																</xsl:for-each>
														</xsl:if>
														<xsl:if test="$goods/tpo:AutomobileInfo/tpo:Engine/tpo:EngineModel and $goods/tpo:AutomobileInfo/tpo:EngineId">, </xsl:if>
														<xsl:if test="$goods/tpo:AutomobileInfo/tpo:EngineId">
															<xsl:text> Номер: </xsl:text><xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:EngineId"/>
														</xsl:if>
												</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailerCode =  2">
													<br/>
													<xsl:text>9. ОТСУТСТВУЕТ</xsl:text>
												</xsl:when>
												<xsl:when test="$goods/tpo:AutomobileInfo/tpo:Engine/tpo:EngineModeName">
													<br/>
													<xsl:text>9. Тип двигателя: </xsl:text><xsl:for-each select="$goods/tpo:AutomobileInfo/tpo:Engine/tpo:EngineModeName"><xsl:if test="position() != 1">, </xsl:if><xsl:apply-templates select="."/></xsl:for-each>
												</xsl:when>
											</xsl:choose>
											<xsl:if test="$goods/tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure or $goods/tpo:UtilCollDetails[tpo:ChassisOrTrailerCode = 1 or tpo:ChassisOrTrailerCode = 2]">
												<br/>
												<xsl:text>10. </xsl:text>
												<xsl:choose>
													<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'К'"> Технически допустимая максимальная масса: </xsl:when>
													<xsl:when test="$goods/tpo:UtilCollDetails/tpo:Sign = 'С'"> Грузоподъемность: </xsl:when>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="$goods/tpo:UtilCollDetails[tpo:ChassisOrTrailerCode = 1 or tpo:ChassisOrTrailerCode = 2]">
														<xsl:apply-templates select="$goods/tpo:UtilCollDetails/tpo:ChassisOrTrailer/tpo:TotalWeight"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="$goods/tpo:AutomobileInfo/tpo:TransportCarryingCapacityMeasure"/>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text> т</xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="$MP = 'АК'">
											<xsl:if test="$goods/tpo:GoodsDescription or $goods/tpo:AddGoodsDescriptionDetails or $goods/tpo:OriginCountryCode">
												<xsl:text>1. </xsl:text><xsl:apply-templates select="$goods/tpo:GoodsDescription"/>
												<xsl:if test="$goods/tpo:AddGoodsDescriptionDetails">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="$goods/tpo:AddGoodsDescriptionDetails"/>
												</xsl:if>
												<xsl:if test="$goods/tpo:OriginCountryCode">
													<xsl:text>, </xsl:text>
													<xsl:apply-templates select="$goods/tpo:OriginCountryCode"/>
												</xsl:if>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="$goods/tpo:SupplementaryQuantity">
													<br/>
													<xsl:text>2. </xsl:text>
													<xsl:for-each select="$goods/tpo:SupplementaryQuantity">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:apply-templates select="./*[local-name() = 'GoodsQuantity' or local-name() = 'MeasureUnitQualifierName']" mode="separated"/>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="$goods/tpo:GoodsNetWeight">
													<br/>
													<xsl:text>2. </xsl:text>
													<xsl:apply-templates select="$goods/tpo:GoodsNetWeight"/><xsl:text> КГ</xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:if test="$goods/tpo:RubleCost">
												<br/>
												<xsl:text>3. </xsl:text>
												<xsl:apply-templates select="$goods/tpo:RubleCost"/>
												<xsl:text> руб.</xsl:text>
											</xsl:if>
											<xsl:if test="$goods/tpo:ContractCost">
												<br/>
												<xsl:text>4. </xsl:text>
												<xsl:apply-templates select="$goods/tpo:ContractCost/*" mode="separated"/>
											</xsl:if>
											<xsl:if test="$goods/tpo:StampsDetails/tpo:GoodsRegDate">
												<br/>
												<xsl:text>5. </xsl:text>
												<xsl:for-each select="$goods/tpo:StampsDetails[tpo:GoodsRegDate]">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="tpo:GoodsRegDate" mode="russian_date"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="$goods/tpo:TobaccoDetails/tpo:SeasonalMultiplier">
												<br/>
												<xsl:text>Применен сезонный коэффициент = </xsl:text>
												<xsl:apply-templates select="$goods/tpo:TobaccoDetails/tpo:SeasonalMultiplier"/>
											</xsl:if>
										</xsl:if>
										<xsl:if test="$MP = 'ДЗ'">
											<xsl:if test="$goods/tpo:StampsDetails/tpo:StampsKind">
												<xsl:text>1. </xsl:text>
												<xsl:for-each select="$goods/tpo:StampsDetails">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:apply-templates select="tpo:StampsKind"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="$goods/tpo:GoodsDescription">
												<br/>
												<xsl:text>2. </xsl:text>
												<xsl:apply-templates select="$goods/tpo:GoodsDescription"/>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="$goods/tpo:SupplementaryQuantity">
													<br/>
													<xsl:text>3. </xsl:text>
													<xsl:for-each select="$goods/tpo:SupplementaryQuantity">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:apply-templates select="./*[local-name() = 'GoodsQuantity' or local-name() = 'MeasureUnitQualifierName']" mode="separated"/>
													</xsl:for-each>
												</xsl:when>
												<xsl:when test="$goods/tpo:GoodsNetWeight">
													<br/>
													<xsl:text>3. </xsl:text>
													<xsl:apply-templates select="$goods/tpo:GoodsNetWeight"/><xsl:text> КГ</xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:if test="$goods/tpo:StampsDetails/tpo:StampsSeriesNumber">
												<br/>
												<xsl:text>4. </xsl:text>
												<xsl:for-each select="$goods/tpo:StampsDetails/tpo:StampsSeriesNumber">
													<xsl:if test="position()!=1">; </xsl:if>
													<xsl:apply-templates select="tpo:ExciseSerieses"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="tpo:ExciseList/*" mode="separated"/>
													<xsl:text> </xsl:text>
													<xsl:for-each select="tpo:ExciseRange">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:apply-templates select="*" mode="separated"><xsl:with-param name="separator" select="'-'"/></xsl:apply-templates>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:if>
										</xsl:if>
										<xsl:if test="$MP = 'ПЛ'">
											<xsl:choose>
												<xsl:when test="$goods_Magadan/tpo:GoodsKindCode = 4"><!-- для Магадана -->
													<xsl:apply-templates select="$goods_Magadan/tpo:GoodsDescription"/>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo/tpo:Mark">
														<br/>
														<xsl:text>Марка: </xsl:text><xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/tpo:Mark"/>
													</xsl:if>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo/tpo:Model ">
														<br/>
														<xsl:text>Модель: </xsl:text><xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/tpo:Model"/>
													</xsl:if>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo/*[local-name() = 'VINID']">
														<br/>
														<xsl:text>VIN: </xsl:text><xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/*[local-name() = 'VINID']"/>
													</xsl:if>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo/*[contains(local-name(), 'Manufact')]">
														<br/>
														<xsl:text>Дата выпуска </xsl:text>
														<xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo" mode="manufactureDateMY"/>
													</xsl:if>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo[tpo:EngineVolumeQuanity or tpo:Engine/tpo:EnginePowerHpQuanity or tpo:Engine/tpo:EnginePowerKvtQuanity]">
														<br/>
														<xsl:text>Объем двигателя: </xsl:text><xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/tpo:EngineVolumeQuanity"/><xsl:text> куб. см. </xsl:text>
														<xsl:if test="$goods_Magadan/tpo:AutomobileInfo[tpo:Engine/tpo:EnginePowerHpQuanity or tpo:Engine/tpo:EnginePowerKvtQuanity]">
															<xsl:if test="$goods_Magadan/tpo:AutomobileInfo[tpo:EngineVolumeQuanity]">, </xsl:if>
															<xsl:text>мощность </xsl:text>
															<xsl:choose>
																<xsl:when test="count($goods_Magadan/tpo:AutomobileInfo/tpo:Engine) &gt; 1">двигателей</xsl:when>
																<xsl:otherwise>двигателя</xsl:otherwise>
															</xsl:choose>
															<xsl:text>: </xsl:text>
															<xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/tpo:Engine" mode="powerKwHp_Magadan"/>
														</xsl:if>
													</xsl:if>
													<xsl:if test="$goods_Magadan/tpo:AutomobileInfo/tpo:VehicleRegistrationDetails/tpo:TransportPassportID">
														<br/>
														<xsl:text>Номер ПТС/ПШТС: </xsl:text>
														<xsl:apply-templates select="$goods_Magadan/tpo:AutomobileInfo/tpo:VehicleRegistrationDetails/tpo:TransportPassportID"/>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise><xsl:text>-</xsl:text></xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="$MP = 'РЕ'">
											<xsl:text>Товары: </xsl:text>
											<xsl:apply-templates select="tpo:AdditionalInformationDetails/tpo:AdditionalInfoText"/>
											<br/>
											<xsl:text>Протокол </xsl:text>
											<xsl:apply-templates select="tpo:AdditionalInformationDetails/tpo:PresentedDocument[1]" mode="document"/>
										</xsl:if>
										<xsl:if test="$MP = 'СХ'">-</xsl:if>
								</span>
								&#160;
							</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td width="50%" class="bordered">
				<table>
					<tbody>
						<tr valign="top">
							<td class="small" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="50%">
								<xsl:text>11. Код товара</xsl:text>
								<br/>
								<span class="normal">
									<xsl:choose>
										<xsl:when test="contains('ИМ ИВ ИД', $MP)">
											<xsl:choose>
												<xsl:when test="$goods/tpo:GoodsTNVEDCode and $goods/tpo:GoodsKindCode=1">
													<xsl:apply-templates select="$goods/tpo:GoodsTNVEDCode"/>
												</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:when test="$goods/tpo:GoodsTNVEDCode|$goods_Magadan/tpo:GoodsTNVEDCode">
											<xsl:apply-templates select="$goods/tpo:GoodsTNVEDCode|$goods_Magadan/tpo:GoodsTNVEDCode"/>
										</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="small" style="border-bottom: 1px solid black;" width="50%">
								<xsl:text>12. Вес товара (кг)</xsl:text>
								<br/>
								<span class="normal">
									<xsl:choose>
										<xsl:when test="contains('ИМ ИД ИВ ИЮ ЭЮ РЗ АК', $MP) and $goods/tpo:GoodsNetWeight">
											<xsl:apply-templates select="$goods/tpo:GoodsNetWeight" mode="translate_number3decimals"/>
										</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="small" style="border-right: 1px solid black; border-bottom: 1px solid black;">
								<xsl:text>13. Количество товара</xsl:text>
								<br/>
								<span class="normal">
									<xsl:choose>
										<xsl:when test="$goods/tpo:GoodsKindCode = 2 and not(contains('2201 2202 2203 2204 2205 2206 2207 2208', $TNVED4))">-</xsl:when>
										<xsl:otherwise>
											<xsl:for-each select="$goods/tpo:SupplementaryQuantity">
												<xsl:if test="position() &gt; 1"><br/></xsl:if>
												<xsl:choose>
													<xsl:when test="number(cat_ru:GoodsQuantity) &lt; 0.01"><xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number6decimals"/></xsl:when>
													<xsl:otherwise><xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number2decimals"/></xsl:otherwise>
												</xsl:choose>
												<xsl:if test="cat_ru:GoodsQuantity and cat_ru:MeasureUnitQualifierCode">/</xsl:if>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
											</xsl:for-each>
											<xsl:if test="not($goods/tpo:SupplementaryQuantity)">-</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="small" style="border-bottom: 1px solid black;">
								<xsl:text>14.</xsl:text>
								<br/>
								<span class="normal">
									<xsl:choose>
										<xsl:when test="contains('ИД РЗ', $MP) and tpo:PaymentCountry/RUScat_ru:CountryCode">
											<xsl:apply-templates select="tpo:TPOTypeCode/tpo:MovementPurpose"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="tpo:PaymentCountry/RUScat_ru:CountryCode"/>
										</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="small" style="border-right: 1px solid black; border-bottom: 1px solid black;">
								<xsl:text>15.</xsl:text>
								<br/>
								<span class="normal">
									<xsl:apply-templates select="../tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber" mode="graph15"/>
									<xsl:if test="not(../tpo:CommonPaymentDetails/tpo:FactPaymentDetails/tpo:PaymentDocDetails/tpo:CustomsReceiptRegNumber)">-</xsl:if>
								</span>
							</td>
							<td class="small" style="border-bottom: 1px solid black;">
								<xsl:text>16.</xsl:text>
								<br/>
								<span class="normal">-</span>
							</td>
						</tr>
						<tr valign="top">
							<td class="small" colspan="2">
								<xsl:text>17. Стоимость товара</xsl:text>
								<table width="100%">
									<tbody>
										<tr valign="top">
											<td width="33%" class="small" style="border-right: 1px solid black;">в евро</td>
											<td width="33%" class="small" style="border-right: 1px solid black;">в национальной валюте</td>
											<td width="33%" class="small">в валюте приобретения</td>
										</tr>
										<tr valign="top">
											<td width="33%" class="normal" style="border-right: 1px solid black;">
												<xsl:apply-templates select="$goods/tpo:EuroCost" mode="translate_number2decimals"/>
												<xsl:if test="not($goods/tpo:EuroCost)">-</xsl:if>
											</td>
											<td width="33%" class="normal" style="border-right: 1px solid black;">
												<xsl:apply-templates select="$goods/tpo:RubleCost" mode="translate_number2decimals"/>
												<xsl:if test="not($goods/tpo:RubleCost)">-</xsl:if>
											</td>
											<td width="33%" class="normal">-</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="tpo:EngineVolumeQuanity">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="round(.)"/>
		</element>
	</xsl:template>
	
	<xsl:template match="tpo:Engine" mode="engineKWtOrHP">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:choose>
			<xsl:when test="tpo:EngineModeCode = 3">
				<xsl:apply-templates select="tpo:EnginePowerKvtQuanity"/><xsl:text> кВт</xsl:text>
			</xsl:when>
			<xsl:when test="tpo:EnginePowerHpQuanity">
				<xsl:apply-templates select="tpo:EnginePowerHpQuanity"/><xsl:text> л.с.</xsl:text>
			</xsl:when>
			<xsl:when test="tpo:EnginePowerKvtQuanity">
				<xsl:apply-templates select="tpo:EnginePowerKvtQuanity"/><xsl:text> кВт</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="document">
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="subString">
		<xsl:param name="start"/>
		<xsl:param name="end"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(., number($start), number($end))"/>
		</element>
	</xsl:template>
	
	<xsl:template match="tpo:CustomsReceiptRegNumber" mode="graph15">
		<xsl:if test="position() != 1">; </xsl:if>
		<xsl:apply-templates select="*[position() = 1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position() = 2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position() = 4]"/>
		<xsl:text>-</xsl:text>
		<xsl:apply-templates select="*[position() = 3]"/>
	</xsl:template>
	
	<xsl:template match="tpo:AutomobileInfo">
		<xsl:apply-templates select="tpo:VINID"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="../tpo:UtilCollDetails[tpo:ChassisOrTrailerCode = 1 or tpo:ChassisOrTrailerCode = 2]/tpo:ChassisOrTrailer/*[contains(local-name(),'Manufact')]">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="../tpo:UtilCollDetails/tpo:ChassisOrTrailer" mode="manufactureDateMY"/>
			</xsl:when>
			<xsl:when test=".">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="." mode="manufactureDateMY"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="tpo:EngineVolumeQuanity">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="tpo:EngineVolumeQuanity"/>
			<xsl:text> куб.см.</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="tpo:Engine" mode="powerKwHp"/>
	</xsl:template>
	
	<xsl:template match="tpo:Engine" mode="powerKwHp_Magadan">
		<xsl:text> </xsl:text>
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:if test="tpo:EnginePowerHpQuanity">
			<xsl:value-of select="tpo:EnginePowerHpQuanity"/>
			<xsl:text> л.с.</xsl:text>
		</xsl:if>
		<xsl:if test="tpo:EnginePowerHpQuanity and tpo:EnginePowerKvtQuanity">, </xsl:if>
		<xsl:if test="tpo:EnginePowerKvtQuanity">
			<xsl:value-of select="tpo:EnginePowerKvtQuanity"/>
			<xsl:text> кВт</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="tpo:Engine" mode="powerKwHp">
		<xsl:text> </xsl:text>
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:if test="tpo:EnginePowerHpQuanity">
			<xsl:value-of select="tpo:EnginePowerHpQuanity"/>
			<xsl:text> л.с.</xsl:text>
		</xsl:if>
		<!-- добавлено 09.04.2025 -->
		<xsl:if test="tpo:EnginePowerHpQuanity and tpo:EnginePowerKvtQuanity">, </xsl:if>
		<xsl:if test="tpo:EnginePowerKvtQuanity">
			<xsl:value-of select="tpo:EnginePowerKvtQuanity"/>
			<xsl:text> кВт</xsl:text>
		</xsl:if>
		<!-- добавлено 09.04.2025 -->
	</xsl:template>
	
	<xsl:template mode="manufactureDateMY" match="*">
		<xsl:variable name="base" select="."/>
		<xsl:apply-templates select="tpo:ManufactureDate" mode="russian_date"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="$base/tpo:ManufactureMonth"/>
		<xsl:if test="$base/tpo:ManufactureMonth and $base/tpo:ManufactureYear">.</xsl:if>
		<xsl:apply-templates select="$base/tpo:ManufactureYear"/>
	</xsl:template>
	
	<xsl:template match="tpo:AddGoodsDescriptionDetails">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:apply-templates select="*" mode="separated"/>
	</xsl:template>
	
	<xsl:template match="tpo:Payer" mode="graph4">
		<xsl:variable name="isFL" select="translate(substring(tpo:PersonIDIndicator, 1, 1), 'TF', 'tf')"/>
		<xsl:variable name="isIP" select="translate(substring(tpo:IEPersonIDIndicator, 1, 1), 'TF', 'tf')"/>
		<xsl:if test="position()!=1"><br/><br/></xsl:if>
		<xsl:choose>
			<xsl:when test="($isFL = 1 or $isFL = 't')">
				<xsl:apply-templates select="." mode="PayerFL"/>
			</xsl:when>
			<xsl:when test="($isFL = 0 or $isFL = 'f') and ($isIP = 1 or $isIP = 't')">
				<xsl:apply-templates select="." mode="PayerIP"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="." mode="PayerUL"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="tpo:Payer" mode="PayerFL">
		<xsl:apply-templates select="tpo:Person/*" mode="separated"/>
		<xsl:if test="tpo:RFOrganizationFeatures/cat_ru:INN or tpo:UITN/RUScat_ru:UITNCode">
			<br/>
			<xsl:choose>
				<xsl:when test="tpo:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>ИНН </xsl:text><xsl:apply-templates select="tpo:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>УИТН </xsl:text><xsl:apply-templates select="tpo:UITN/RUScat_ru:UITNCode"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="not(tpo:RFOrganizationFeatures/cat_ru:INN)"><!-- очень важное требование для ФЛ с ИНН -->
			<xsl:if test="tpo:TPOAddress">
				<br/>
				<xsl:text>Адрес: </xsl:text>
				<xsl:apply-templates select="tpo:TPOAddress"/>
			</xsl:if>
			<xsl:if test="tpo:IdentityDoc">
				<br/>
				<xsl:apply-templates select="tpo:IdentityDoc" mode="identity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="tpo:PayerBirthDay">
			<br/>
			<xsl:text>Дата рождения: </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="tpo:PayerBirthDay"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="tpo:Payer" mode="PayerIP">
		<xsl:apply-templates select="tpo:Person/*" mode="separated"/>
		<xsl:if test="tpo:RFOrganizationFeatures/cat_ru:INN or tpo:UITN/RUScat_ru:UITNCode">
			<br/>
			<xsl:choose>
				<xsl:when test="tpo:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>ИНН </xsl:text><xsl:apply-templates select="tpo:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>УИТН </xsl:text><xsl:apply-templates select="tpo:UITN/RUScat_ru:UITNCode"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="tpo:TPOAddress">
			<br/>
			<xsl:text>Адрес: </xsl:text>
			<xsl:apply-templates select="tpo:TPOAddress"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="tpo:Payer" mode="PayerUL">
		<xsl:apply-templates select="tpo:ShortName"/>
		<xsl:apply-templates select="tpo:PayerName[not(../tpo:ShortName)]"/>
		<xsl:if test="tpo:RFOrganizationFeatures/cat_ru:INN or tpo:UITN/RUScat_ru:UITNCode">
			<br/>
			<xsl:choose>
				<xsl:when test="tpo:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>ИНН </xsl:text><xsl:apply-templates select="tpo:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>УИТН </xsl:text><xsl:apply-templates select="tpo:UITN/RUScat_ru:UITNCode"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="tpo:TPOAddress">
			<br/>
			<xsl:text>Адрес: </xsl:text>
			<xsl:apply-templates select="tpo:TPOAddress"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="RUScat_ru:SubjectAddressDetails|tpo:TPOAddress">
		<xsl:param name="personIndicator"/>
		<xsl:param name="IPIndicator"/>
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() = 'CounryName' or local-name() = 'Region' or local-name() = 'District' or local-name() = 'Town' or local-name() = 'City' or local-name() = 'StreetHouse' or local-name() = 'House' or local-name() = 'Room']">
					<xsl:variable name="ln" select="local-name()"/>
					<xsl:if test="position()!=1">, </xsl:if>
					<!--xsl:choose>
						<xsl:when test="$ln = 'Town' or ($ln = 'City' and local-name(preceding-sibling::node()) != 'Town')">
							<xsl:text> г. </xsl:text>
						</xsl:when>
						<xsl:when test="$ln = 'StreetHouse'">
							<xsl:text> ул. </xsl:text>
						</xsl:when>
						<xsl:when test="$ln = 'House'">
							<xsl:text> д. </xsl:text>
						</xsl:when>
					</xsl:choose-->
					<xsl:apply-templates select="."/>
				</xsl:for-each>				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="identity">
		<span class="header">
			<xsl:text> Документ, удостоверяющий личность: </xsl:text>
		</span>
		<br/>
			<xsl:call-template name="separatedSequence">
				<xsl:with-param name="base" select="."/>
				<xsl:with-param name="sequence" select="'CountryCode, IdentityCardCode, IdentityCardSeries, IdentityCardNumber, IdentityCardDate'"/>
				<xsl:with-param name="separator" select="', '"/>
			</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="separatedSequence">
		<xsl:param name="base"/>
		<xsl:param name="sequence" select="''"/>
		<xsl:param name="separator" select="' '"/>
		<xsl:param name="iteration" select="number('0')"/>
		
		<xsl:variable name="name">
			<xsl:choose>
				<xsl:when test="string-length(substring-before($sequence, ', ')) = 0 and string-length($sequence) != 0">
					<xsl:value-of select="$sequence"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-before($sequence, ', ')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sequenceRest" select="substring($sequence, string-length($name) + 3)"/>
		
		<xsl:variable name="chosenElement" select="$base/*[local-name() = $name]"/>
		
		<xsl:if test="$chosenElement and $iteration!=0"><xsl:text>, </xsl:text></xsl:if>
		
		<xsl:choose>
			<xsl:when test="contains(local-name($chosenElement), 'Date')">
				<xsl:apply-templates select="$chosenElement" mode="russian_date"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$chosenElement"/>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="string-length($sequenceRest) &gt; 0">
			<xsl:call-template name="separatedSequence">
				<xsl:with-param name="base" select="$base"/>
				<xsl:with-param name="sequence" select="$sequenceRest"/>
				<xsl:with-param name="separator" select="$separator"/>
				<xsl:with-param name="iteration">
					<xsl:choose>
						<xsl:when test="$chosenElement">
							<xsl:value-of select="number($iteration) + 1"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="number($iteration)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="separated">
		<xsl:param name="separator" select="' '"/>
		<!-- пробел по умолчанию -->
		<xsl:if test="position()!=1">
			<xsl:value-of select="$separator"/>
		</xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="tpo:TPORegNumber|tpo:PrevTPORegNumber">
		<xsl:apply-templates select="tpo:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="tpo:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="tpo:DocNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="tpo:NumPP"/>
		<xsl:if test="not(tpo:NumPP)">00</xsl:if>
	</xsl:template>
	
	<xsl:template match="tpo:CustomsDeclarationIdDetails" mode="gtd_num_3">
		<xsl:apply-templates select="*[position() = 1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position() = 2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[position() = 3]"/>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
	</xsl:template>
	
	<xsl:template match="*" mode="currency">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/VALNAME[@KOD = $val]/@BUK"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="string($val)='643'">RUB</xsl:when>
						<xsl:when test="string($val)='978'">EUR</xsl:when>
						<xsl:when test="string($val)='840'">USD</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="qualCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/EDIZM[@KOD = $val]/@KRNAIM"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</element>
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
	<xsl:template name="russian_dateY2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
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
	<xsl:template match="//*[local-name()='TPO']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_dateY2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_dateY2">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number2decimals">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(format-number(., '0.00'),'.', ',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number3decimals">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(format-number(., '0.000'),'.', ',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number6decimals">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(format-number(., '0.000000'),'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>