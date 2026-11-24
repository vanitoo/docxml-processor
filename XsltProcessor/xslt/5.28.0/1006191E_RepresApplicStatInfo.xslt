<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:rasi="urn:customs.ru:Information:CustomsDocuments:RepresApplicStatInfo:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="rasi:RepresApplicStatInfo">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Сведения о поставках в адрес физического лица</title>
				<style type="text/css">
					body {
					background: #ffffff;
					}

					div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
					}

					h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
					}

					.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
					}

					.header {
					font-weight: bold;
					margin-top:20px;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					border: 1px solid gray;
					font-family: Courier New;
					vertical-align:top;
					}

					.low {
					font: 12;
					font-fase: Courier New;
					}
					.graph {
					font-family: Arial;
					font-size: 8pt;
					}
					jh {
					font: 16;
					font-face: Arial;
					}
					dog1 {
					position:relative;
					left: 50px;
					bottom: 50px;
					}
					.gra {
					font-family: Arial;
					font-size: 6pt;
					}
					.g{
					border-right:0pt solid;
					}
					.р{

					<!--text-orientation: sideways-right;-->
					-webkit-transform: rotate(180deg);
					-moz-transform: rotate(180deg);
					-o-transform: rotate(180deg);
					transform: rotate(180deg);
					filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
					}
					.graph1 {
					font-family: Arial;
					font-size: 7pt;
					}
				</style>
			</head>
			<body>
				<div class="album_page">
					<table>
						<tr>
							<td align="center" style="border:solid 0pt">
								<font face="Times new roman" size="4">Сведения о товарах, поставленных получателю за текущий учетный период</font>
							</td>
						</tr>
						<tr>
							<td style="border:solid 0pt">
								<font face="Times new roman" size="3">
									Регистрационный номер документа:
									<xsl:if test="rasi:DocID/rasi:DTRegNum">
										<xsl:call-template name="gdt_number">
											<xsl:with-param name="code" select="rasi:DocID/rasi:DTRegNum/cat_ru:CustomsCode"/>
											<xsl:with-param name="date" select="rasi:DocID/rasi:DTRegNum/cat_ru:RegistrationDate"/>
											<xsl:with-param name="regnum" select="rasi:DocID/rasi:DTRegNum/cat_ru:GTDNumber"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="rasi:DocID/rasi:MPORegNum">
										<xsl:call-template name="gdt_number">
											<xsl:with-param name="code" select="rasi:DocID/rasi:MPORegNum/rasi:CustomsCode"/>
											<xsl:with-param name="date" select="rasi:DocID/rasi:MPORegNum/rasi:RegistrationDate"/>
											<xsl:with-param name="regnum" select="rasi:DocID/rasi:MPORegNum/rasi:MPO_Number"/>
										</xsl:call-template>
									</xsl:if>
								</font>
							</td>
						</tr>
						<xsl:if test="rasi:Month">
							<tr>
								<td style="border:solid 0pt">
									<font face="Times new roman" size="3">
										Количество месяцев, за которое приведена статистика: <xsl:value-of select="rasi:Month"/>
									</font>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td>
								<table>
									<tbody>
										<xsl:for-each select="rasi:Consignment">
											<tr>
												<td colspan="3" style="border:solid 0pt"> </td>
											</tr>
											<xsl:if test="rasi:WayBill">
												<tr>
													<td colspan="3" style="border:solid 0pt">
														<b>Сведения о накладной:</b>
														<br/>
														<xsl:for-each select="rasi:WayBill">
															<!--xsl:if test="rasi:WayBillKind">
																Тип:
																<xsl:choose>
																	<xsl:when test="rasi:WayBillKind='1'">индивидуальная накладная</xsl:when>
																	<xsl:when test="rasi:WayBillKind='2'">общая авианакладная</xsl:when>
																	<xsl:when test="rasi:WayBillKind='3'">транспортная накладная</xsl:when>
																</xsl:choose>
																<br/>
															</xsl:if-->
															<xsl:if test="cat_ru:PrDocumentName">
																<xsl:value-of select="cat_ru:PrDocumentName"/>
																<br/>
															</xsl:if>
															<xsl:if test="cat_ru:PrDocumentNumber">
																Номер: <xsl:value-of select="cat_ru:PrDocumentNumber"/> 
															</xsl:if>
															<xsl:if test="cat_ru:PrDocumentDate">
																Дата:
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
																</xsl:call-template>
															</xsl:if>
															<xsl:if test="rasi:ExpressNum">
																<xsl:text> Рег.номер реестра экспресс-грузов: </xsl:text>
																<xsl:call-template name="gdt_number">
																	<xsl:with-param name="code" select="rasi:ExpressNum/cat_ru:CustomsCode"/>
																	<xsl:with-param name="date" select="rasi:ExpressNum/cat_ru:RegistrationDate"/>
																	<xsl:with-param name="regnum" select="rasi:ExpressNum/cat_ru:GTDNumber"/>
																</xsl:call-template>
															</xsl:if>
															<xsl:if test="rasi:DecisionCode">
																<br/>
																<xsl:text>Принятое </xsl:text>
																<xsl:if test="rasi:DecisionDate">
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="rasi:DecisionDate"/>
																	</xsl:call-template>
																	<xsl:text> в </xsl:text>
																	<xsl:value-of select="substring(rasi:DecisionDate, 12, 8)"/>
																	<xsl:text> </xsl:text>
																</xsl:if>
																<xsl:text>решение: </xsl:text>
																<xsl:choose>
																	<xsl:when test="rasi:DecisionCode=10">выпуск товаров без уплаты таможенных платежей</xsl:when>
																	<xsl:when test="rasi:DecisionCode=30">выпуск возвращаемых товаров разрешен</xsl:when>
																	<xsl:when test="rasi:DecisionCode=31">требуется уплата таможенных платежей</xsl:when>
																	<xsl:when test="rasi:DecisionCode=32">выпуск товаров разрешен, таможенные платежи уплачены</xsl:when>
																	<xsl:when test="rasi:DecisionCode=40">разрешение на отзыв</xsl:when>
																	<xsl:when test="rasi:DecisionCode=70">продление срока выпуска</xsl:when>
																	<xsl:when test="rasi:DecisionCode=90">отказ в выпуске товаров</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
																<xsl:if test="rasi:DecisionCode=90">
																	<xsl:text>; причина отказа:</xsl:text>
																	<xsl:if test="rasi:ReasonCode">
																		<xsl:text> (код - </xsl:text>
																		<xsl:value-of select="rasi:ReasonCode"/>
																		<xsl:text>)</xsl:text>
																	</xsl:if>
																	<xsl:if test="rasi:Reason">
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="rasi:Reason"/>
																	</xsl:if>
																</xsl:if>
															</xsl:if>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td style="border: 0px;">
														<br/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td colspan="2" style="border:solid 0pt" width="50%">Признак наличия превышения по весу для данной посылки / багажа:</td>
												<td style="border:solid 0pt">
													<table>
														<tr>
															<td align="right" bordercolor="#ffffff" style="border:solid 0pt">Есть-</td>
															<td align="center" style="border:solid 1.5pt; width:5mm">
																<xsl:choose>
																	<xsl:when test="(number(rasi:OverWeightSign)=1) or (rasi:OverWeightSign='true') or (rasi:OverWeightSign='t')">х</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
															<td align="right" style="border:solid 0pt">Нет-</td>
															<td align="center" style="border:solid 1.5pt; width:5mm">
																<xsl:choose>
																	<xsl:when test="(number(rasi:OverWeightSign)=0) or (rasi:OverWeightSign='f') or (rasi:OverWeightSign='false')">х</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="border:solid 0pt" width="50%">Признак наличия превышения по стоимости для данной посылки / багажа:</td>
												<td style="border:solid 0pt">
													<table>
														<tr>
															<td align="right" bordercolor="#ffffff" style="border:solid 0pt">Есть-</td>
															<td align="center" style="border:solid 1.5pt; width:5mm">
																<xsl:choose>
																	<xsl:when test="(number(rasi:OverCostSign)=1) or (rasi:OverCostSign='true') or (rasi:OverCostSign='t')">х</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
															<td align="right" style="border:solid 0pt">Нет-</td>
															<td align="center" style="border:solid 1.5pt; width:5mm">
																<xsl:choose>
																	<xsl:when test="(number(rasi:OverCostSign)=0) or (rasi:OverCostSign='f') or (rasi:OverCostSign='false')">х</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td width="40%">
													Стоимость товаров за период, ранее поступивших в адрес получателя, евро:<br/>
													<xsl:value-of select="rasi:PreviousGoodsCost"/>
												</td>
												<td width="30%">
													Вес товаров брутто за период, ранее поступивших в адрес получателя, кг:<br/>
													<xsl:value-of select="rasi:PreviousGoodsGrossWeight"/>
												</td>
												<td>
													Частота перемещения товаров в адрес получателя:<br/>
													<xsl:value-of select="rasi:GoodsFrequency"/>
												</td>
											</tr>
											<tr>
												<td colspan="3" style="border:solid 0pt">
													<b>Получатель:</b>
													<xsl:for-each select="rasi:Consignee">
														<xsl:choose>
															<xsl:when test="rasi:Person">
																<xsl:for-each select="rasi:Person">
																	<xsl:if test="cat_ru:PersonPost">
																		<xsl:value-of select="cat_ru:PersonPost"/>
																		<xsl:text> </xsl:text>
																	</xsl:if>
																	<xsl:value-of select="cat_ru:PersonSurname"/>
																	<xsl:text> </xsl:text>
																	<xsl:value-of select="cat_ru:PersonName"/>
																	<xsl:if test="cat_ru:PersonMiddleName">
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="cat_ru:PersonMiddleName"/>
																	</xsl:if>
																</xsl:for-each>
															</xsl:when>
															<xsl:when test="rasi:JuridicalPerson">
																<xsl:for-each select="rasi:JuridicalPerson">
																	<xsl:value-of select="rasi:ShortName"/>
																	<xsl:if test="rasi:OrganizationName">
																		<xsl:text> (</xsl:text>
																		<xsl:value-of select="rasi:OrganizationName"/>
																		<xsl:text>)</xsl:text>
																	</xsl:if>
																</xsl:for-each>
															</xsl:when>
														</xsl:choose>
														<xsl:if test="rasi:OrganizationLanguage or rasi:RFOrganizationFeatures">
															<br/>
															<xsl:if test="rasi:OrganizationLanguage">
																<xsl:value-of select="rasi:OrganizationLanguage"/>
															</xsl:if>
															<xsl:if test="rasi:RFOrganizationFeatures">
																<xsl:apply-templates select="rasi:RFOrganizationFeatures"/>
															</xsl:if>
														</xsl:if>
														<xsl:if test="rasi:ConsigneeSign">
															<br/>
															<xsl:choose>
																<xsl:when test="rasi:ConsigneeSign = 0">по товаросопроводительным документам</xsl:when>
																<xsl:when test="rasi:ConsigneeSign = 1">по доверенности</xsl:when>
															</xsl:choose>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td style="border:solid 0pt">
													<xsl:if test="rasi:Consignee/rasi:Address">
														<xsl:apply-templates select="rasi:Consignee/rasi:Address"/>
														<br/>
													</xsl:if>
												</td>
												<td colspan="2" style="border:solid 0pt">
													<xsl:if test="rasi:Consignee/rasi:IdentityCard">
														<xsl:apply-templates select="rasi:Consignee/rasi:IdentityCard"/>
													</xsl:if>
												</td>
											</tr>
											<xsl:if test="rasi:Goods">
												<tr>
													<td colspan="3" style="border:solid 0pt">
														<b>Перечень ранее поставленных получателю товаров:</b>
													</td>
												</tr>
											</xsl:if>
											<xsl:for-each select="rasi:Goods">
												<tr>
													<td colspan="3" style="border:solid 0pt">
														<xsl:number format="1." value="rasi:GoodsNumeric"/>
														<xsl:text> </xsl:text>
														<xsl:for-each select="rasi:GoodsDescription">
															<xsl:value-of select="."/> 
														</xsl:for-each>
														Вес товаров, брутто, кг:<xsl:value-of select="rasi:GrossWeight"/>; 
														Стоимость товара в евро:<xsl:value-of select="rasi:GoodsCostEuro"/>; 
														Дата поставки товара:
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rasi:GoodsDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:if test="position()!=last()">
												<td colspan="3" style="border-left:0px solid #ffffff; border-top:1pt solid #ffffff; border-right:0px solid #ffffff; border-bottom:1pt solid #000000;"/>
											</xsl:if>
										</xsl:for-each>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="rasi:RFOrganizationFeatures | cat_ru:RFOrganizationFeatures | cat_ru:RKOrganizationFeatures | cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
				ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span> 
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
				ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span> 
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
				КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span> 
		</xsl:if>
	</xsl:template>
	<xsl:template match="rasi:Address">
		<u>Адрес:</u>
		<br/>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			(<xsl:value-of select="cat_ru:CountryCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="rasi:IdentityCard">
		<u>Документ, удостоверяющий личность:</u>
		<br/>		
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
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="gdt_number">
		<xsl:param name="code"/>
		<xsl:param name="date"/>
		<xsl:param name="regnum"/>
		<xsl:if test="$code!=''">
			<xsl:value-of select="$code"/>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:if test="$date!=''">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="$date"/>
			</xsl:call-template>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:value-of select="$regnum"/>
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
</xsl:stylesheet>
