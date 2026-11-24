<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 148н от 11 октября 2021 года. Приложение к приказу - Квитанция на оплату ТПО -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:tpo_rcp="urn:customs.ru:Information:ExchangeDocuments:TPOReceipt:5.26.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:param name="Aztec"/>
	<xsl:template match="tpo_rcp:TPOReceipt">
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>Квитанция на оплату ТПО</title>
				<style type="text/css">
					body
					{background: #cccccc; font-family: Arial;}

					div.page
					{width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid gray;}

					td
					{font-family: Courier, serif;
					vertical-align: top;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					jh
					{font: 16;
					font-face: Arial;}

					dog1
					{position: relative;
					left: 50px;
					bottom: 50px;}

					.gra
					{font-family: Arial;
					font-size: 6pt;}

					.g
					{border-right: 0pt solid;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: normal;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.normal
					{font-weight: bold;
					font-family: Arial;
					font-size: 10pt;
					border-left: medium none;
					border-right: medium none;
					border-top: medium none;
					border-bottom: 1pt solid windowtext;}

					.center
					{text-align: center;}

					.w190
					{width: 190mm;}

					div.row > span
					{display: inline-block;}

					div
					{margin: 0;
					padding: 0;}

					.right
					{text-align: right;}

					.mt
					{margin-top:8mm;}

					.mb
					{margin-bottom:3mm;}

					.descr
					{font-size: 8pt;
					text-align: center;}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td style="width:25%">
									
								</td>
								<td style="width:50%">
									<table>
										<tr>
											<td class="graphMain center">
												<font size="4">
													<b>
														<xsl:text>Квитанция</xsl:text>
													</b>	
												</font>
											</td>
										</tr>
									</table>
									<br/>
									<table class="w190" align="center" style="width: 100mm">
										<tr>
											<td class="graphMain" style="width: 33mm">
												<xsl:text>дата регистрации:</xsl:text>
											</td>
											<td class="graphMain">
												<span style="width: 67mm; border-bottom: 1px solid black; text-align: center; display: inline-block;">
													<xsl:choose>
														<xsl:when test="tpo_rcp:Document">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="tpo_rcp:Document/tpo_rcp:RegistrationDate"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="tpo_rcp:ExpressDocNumber">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="tpo_rcp:ExpressDocNumber/cat_ru:RegistrationDate"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="graphLittle"/>
											<td class="graphLittle center">
												<xsl:text>(дата регистрации документа основания платежа)</xsl:text>
											</td>
										</tr>
									</table>
									<table class="w190" align="center" style="width: 100mm">
										<tr>
											<td class="graphMain" style="width: 3mm">
												<xsl:text>к</xsl:text>
											</td>
											<td class="graphMain">
												<span style="width: 97mm; border-bottom: 1px solid black; text-align: center; display: inline-block;">
													<xsl:choose>
														<xsl:when test="tpo_rcp:Document">
															<xsl:text>ТПО №</xsl:text>
															<xsl:value-of select="tpo_rcp:Document/tpo_rcp:CustomsCode"/>
															<xsl:text>/</xsl:text>
															<xsl:call-template name="gtd_date">
																<xsl:with-param name="dateIn" select="tpo_rcp:Document/tpo_rcp:RegistrationDate"/>
															</xsl:call-template>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="tpo_rcp:Document/tpo_rcp:DocNumber"/>
															<xsl:if test="tpo_rcp:Document/tpo_rcp:NumPP">
																<xsl:text>/</xsl:text>
																<xsl:value-of select="tpo_rcp:Document/tpo_rcp:NumPP"/>
															</xsl:if>
														</xsl:when>
														<xsl:when test="tpo_rcp:ExpressDocNumber">
															<xsl:text>ПТДЭГ №</xsl:text>
															<xsl:value-of select="tpo_rcp:ExpressDocNumber/cat_ru:CustomsCode"/>
															<xsl:text>/</xsl:text>
															<xsl:call-template name="gtd_date">
																<xsl:with-param name="dateIn" select="tpo_rcp:ExpressDocNumber/cat_ru:RegistrationDate"/>
															</xsl:call-template>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="tpo_rcp:ExpressDocNumber/cat_ru:GTDNumber"/>
															<xsl:if test="tpo_rcp:ExpressDocNumber/tpo_rcp:AddNumber">
																<xsl:text>/</xsl:text>
																<xsl:value-of select="tpo_rcp:ExpressDocNumber/tpo_rcp:AddNumber"/>
															</xsl:if>
															<xsl:if test="tpo_rcp:InvoiceNumber">
																<xsl:text>/</xsl:text>
																<xsl:value-of select="tpo_rcp:InvoiceNumber"/>
															</xsl:if>
														</xsl:when>
													</xsl:choose>
												</span>
											</td>
										</tr>
										<tr>
											<td class="graphLittle"/>
											<td class="graphLittle center">
												<xsl:text>(наименование и номер документа основания платежа)</xsl:text>
											</td>
										</tr>
									</table>
								</td>
								<td style="width:25%">
									
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 17mm">
								<xsl:text>Таможня:</xsl:text>
							</td>
							<td class="graphMain center" style="width: 163mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:CustomsHouse/cat_ru:Code"/>
								<xsl:if test="tpo_rcp:CustomsHouse/cat_ru:OfficeName">
									<xsl:text> </xsl:text>
									<xsl:value-of select="tpo_rcp:CustomsHouse/cat_ru:OfficeName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(код и наименование таможни)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 30mm">
								<xsl:text>таможенный пост</xsl:text>
							</td>
							<td class="graphMain center" style="width: 150mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:CustomsPost/cat_ru:Code"/>
								<xsl:if test="tpo_rcp:CustomsPost/cat_ru:OfficeName">
									<xsl:text> </xsl:text>
									<xsl:value-of select="tpo_rcp:CustomsPost/cat_ru:OfficeName"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(код и наименование таможенного поста)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190 mt">
						<tr>
							<td class="graphMain" style="width: 20mm">
								<xsl:text>Получатель:</xsl:text>
							</td>
							<td class="graphMain center" style="width: 160mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:OrganizationName"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(фамилия, имя, отчество (при наличии) получателя)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 10mm">
								<xsl:text>ИНН</xsl:text>
							</td>
							<td class="graphMain center" style="width: 80mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:INN"/>
							</td>
							<td class="graphMain center" style="width: 15mm">
								<xsl:text>КПП</xsl:text>
							</td>
							<td class="graphMain center" style="width: 75mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:KPPCode"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(ИНН получателя)</xsl:text>
							</td>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(КПП получателя)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 30mm">
								<xsl:text>Банк получателя</xsl:text>
							</td>
							<td class="graphMain center" style="width: 100mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:BankName"/>
							</td>
							<td class="graphMain center" style="width: 10mm">
								<xsl:text>БИК</xsl:text>
							</td>
							<td class="graphMain center" style="width: 40mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:BIC"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(наименование банка получателя)</xsl:text>
							</td>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(БИК банка получателя)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:30mm">
								<xsl:text>Счет получателя</xsl:text>
							</td>
							<td class="graphMain center" style="width: 160mm; border-bottom: solid 1pt #000000">
								<xsl:if test="tpo_rcp:Recipient/tpo_rcp:CorrespAccount">
								<xsl:text>корреспондентский - </xsl:text>
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:CorrespAccount"/>
								</xsl:if>
								<xsl:if test="tpo_rcp:Recipient/tpo_rcp:CorrespAccount and tpo_rcp:Recipient/tpo_rcp:PersonalAccount">
								<xsl:text>; </xsl:text>
								</xsl:if>
								<xsl:if test="tpo_rcp:Recipient/tpo_rcp:PersonalAccount">
								<xsl:text>лицевой - </xsl:text>
								<xsl:value-of select="tpo_rcp:Recipient/tpo_rcp:PersonalAccount"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(счет органа Федерального казначейства)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190 mt">
						<tr>
							<td class="graphMain" style="width: 20mm">
								<xsl:text>Плательщик:</xsl:text>
							</td>
							<td class="graphMain center" style="width: 160mm; border-bottom: solid 1pt #000000">
								<xsl:if test="tpo_rcp:Payer/tpo_rcp:PayerName">
									<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:PayerName"/>
								</xsl:if>
								<xsl:if test="not(tpo_rcp:Payer/tpo_rcp:PayerName)">
									<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Person/tpo_rcp:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Person/tpo_rcp:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:if test="tpo_rcp:Payer/tpo_rcp:Person/tpo_rcp:PersonMiddleName">
										<xsl:text> </xsl:text>
										<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Person/tpo_rcp:PersonMiddleName"/>
									</xsl:if>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(наименование или фамилия, имя, отчество (при наличии) плательщика)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 15mm">
								<xsl:text>Страна</xsl:text>
							</td>
							<td class="graphMain center" style="width: 115mm; border-bottom: solid 1pt #000000">
								<xsl:if test="tpo_rcp:Payer/tpo_rcp:TaxCountryCode">
									<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:TaxCountryCode"/>
								</xsl:if>
								<xsl:if test="not(tpo_rcp:Payer/tpo_rcp:TaxCountryCode)">
									<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Passport/RUScat_ru:CountryCode"/>
								</xsl:if>
							</td>
							<td class="graphMain center" style="width: 10mm">
								<xsl:text>ИНН</xsl:text>
							</td>
							<td class="graphMain center" style="width: 40mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:INN"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(код страны, в которой плательщик поставлен на налоговый учет, или код страны, уполномоченным органом которой выдан документ, удостоверяющий личность плательщика</xsl:text><sup>1</sup><xsl:text>)</xsl:text>
							</td>
							<td class="graphLittle"/>
							<td class="graphLittle center">
								<xsl:text>(налоговый номер (ИНН) плательщика)</xsl:text>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width:94mm">
								<xsl:text>Паспортные данные плательщика</xsl:text>
							</td>
							<td style="width:2mm"/>
							<td class="graphMain" style="width:94mm"/>
						</tr>
						<tr>
							<td class="graphMain center" style="width: 94mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Passport/RUScat_ru:IdentityCardCode"/>
							</td>
							<td class="graphMain center" style="width:2mm">
								<xsl:text>/</xsl:text>
							</td>
							<td class="graphMain center" style="width: 94mm; border-bottom: solid 1pt #000000">
								<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Passport/RUScat_ru:IdentityCardSeries"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="tpo_rcp:Payer/tpo_rcp:Passport/RUScat_ru:IdentityCardNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graphLittle center">
								<xsl:text>(код вида документа, удостоверяющего личность плательщика</xsl:text><sup>2</sup><xsl:text>)</xsl:text>
							</td>
							<td style="width:2mm"/>
							<td class="graphLittle center">
								<xsl:text>(серия и номер документа, удостоверяющего личность плательщика)</xsl:text>
							</td>
						</tr>
					</table>
					<br/>
					<table class="w190 border mb">
						<tr align="center">
							<td class="graphMain">
								<xsl:text>Вид платежа</xsl:text>
							</td>
							<td class="graphMain">
								<xsl:text>КБК</xsl:text>
							</td>
							<td class="graphMain">
								<xsl:text>Наименование платежа</xsl:text>
							</td>
							<td class="graphMain" style="width:15%;">
								<xsl:text>Сумма к оплате</xsl:text>
							</td>
							<td class="graphMain">
								<xsl:text>Валюта</xsl:text>
							</td>
						</tr>
						<xsl:for-each select="tpo_rcp:Payments">
							<xsl:sort select="tpo_rcp:PaymentsKind" data-type="text" order="ascending"/>
							<tr>
								<td class="graphMain">
									<xsl:value-of select="tpo_rcp:PaymentsKind"/>
								</td>
								<td class="graphMain">
									<xsl:value-of select="tpo_rcp:BCC"/>
								</td>
								<td class="graphMain">
									<xsl:value-of select="tpo_rcp:PaymentsName"/>
								</td>
								<td class="graphMain right">
									<xsl:value-of select="translate(translate(format-number(tpo_rcp:Amount, '#,##0.00'), ',', ' '), '.', ',')"/>
								</td>
								<td class="graphMain center">
									<xsl:value-of select="tpo_rcp:CurrencyName"/>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="graphMain"/>
							<td class="graphMain" align="left">
								<xsl:text>ИТОГО</xsl:text>
							</td>
							<td class="graphMain"/>
							<td class="graphMain right">
								<xsl:value-of select="translate(translate(format-number(tpo_rcp:TotalAmount, '#,##0.00'), ',', ' '), '.', ',')"/>
							</td>
							<td class="graphMain center">
								<xsl:value-of select="tpo_rcp:CurrencyName"/>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:if test="tpo_rcp:Status">
						<table class="w190">
							<tr align="left">
								<td class="graphMain">
									<xsl:text>Статус: </xsl:text>
									<xsl:choose>
										<xsl:when test="tpo_rcp:Status = 0">сформировано</xsl:when>
										<xsl:when test="tpo_rcp:Status = 1">оплачено</xsl:when>
										<xsl:when test="tpo_rcp:Status = 2">аннулировано</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="tpo_rcp:Status"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<xsl:variable name="checkDate" select="'2022-12-23'"/><!-- Дебаг баркодов - формат: ГГГГ-ММ-ДД -->
					<xsl:variable name="checkDateRes">
						<xsl:choose>
							<xsl:when test="tpo_rcp:ReceiptDate and (number(translate(tpo_rcp:ReceiptDate, '-', '')) >= number(translate($checkDate, '-', '')))">true</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<table class="w190">
						<tr>
							<td class="graphMain" style="width: 55mm" align="left">
								<xsl:if test="$Aztec">
									<xsl:if test="$checkDateRes = 'true'">
										AZTECcode для операторов таможенных платежей
									</xsl:if>
									<img style="width: 50mm; height: 50mm;" src="{$Aztec}"/>
								</xsl:if>
							</td>
							<td class="graphMain" style="width: 10mm"></td>
							<td class="graphMain center" style="width: 55mm" align="right">
								<xsl:if test="tpo_rcp:BarCode[1] and string-length(tpo_rcp:BarCode[1]) != 0">
									<xsl:if test="$checkDateRes = 'true'">
										QRCode для кредитных организаций
									</xsl:if>
									<img style="width: 100mm; height: 100mm;" src="{tpo_rcp:BarCode[1]}"/>
								</xsl:if>
							</td>
							<td class="graphMain" style="width: 5mm"></td>
							<td class="graphMain center" style="width: 55mm" align="right">
								<xsl:if test="tpo_rcp:BarCode[2] and string-length(tpo_rcp:BarCode[2]) != 0">
									<xsl:if test="$checkDateRes = 'true'">
										AZTECcode для операторов таможенных платежей
									</xsl:if>
									<img style="width: 50mm; height: 50mm; margin-top:93px" src="{tpo_rcp:BarCode[2]}"/>
								</xsl:if>
							</td>
						</tr>
					</table>
					<!--table class="w190">
						<tr>
							<td class="graphMain" style="width: 20mm"></td>
							<td class="graphMain" style="width: 60mm; border: solid 1pt #000000"></td>
							<td class="graphMain" style="width: 20mm"></td>
							<td class="graphMain center" style="width: 80mm">
								<xsl:text>(штриховой код, содержащий информацию, указанную в квитанции)</xsl:text>
							</td>
						</tr>
					</table>
					<br/>
					<br/>
					<table>
						<td class="graphLittle">
							<sup>1</sup><xsl:text>В соответствии с классификатором стран мира, утвержденным Решением Комиссии Таможенного союза от 20 сентября 2010 г. № 378 "О классификаторах, используемых для заполнения таможенных документов" (далее - Решение № 378) (Опубликовано на официальном сайте Комиссии Таможенного союза http://www.tsouz.ru, 21 сентября 2010 г.), Договор о Евразийском экономическом союзе от 29 мая 2014 г. (Официальный сайт Евразийской экономической комиссии http://www.eurasiancommission.org/, 5 июня 2014 г.).</xsl:text>
							<br/>
							<sup>2</sup><xsl:text>В соответствии с классификатором видов документов и сведений, утвержденным Решением № 378 (Опубликовано на официальном сайте Комиссии Таможенного союза http://www.tsouz.ru, 21 сентября 2010 г.), Договор о Евразийском экономическом союзе от 29 мая 2014 г. (Официальный сайт Евразийской экономической комиссии http://www.eurasiancommission.org/, 5 июня 2014 г.).</xsl:text>
						</td>
					</table-->
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring($dateIn, 9, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
		<xsl:text> г.</xsl:text>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
