<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:nGTDr="urn:customs.ru:Information:ExchangeDocuments:NotifGTDRegistration:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					@media print {
						div.page {
							border: none;
							margin:0;
							padding:0;
						}
					}

					body {
						background: #cccccc;
					}

					div.page {
						width: 180mm;
						margin: 10px auto;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 20mm;
						background: #ffffff;
						border: solid 1pt #000000;
					}

					.marg-top {
						margin-top:5mm;
					}

					table {
						width: 100%;
						border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
					}

					table.border tr {
						border: 1px solid gray;
						padding: 5px;
					}

					table.border td {
						padding: 5px;
						border: solid 1px windowtext;
					}

					.graph {
						font-family: Arial;
						font-size: 10pt;
					}

					.value {
						border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }

					.bordered { border-collapse: collapse; }

					td.bordered {
						border: solid 1px windowtext;
					}

					td.graphMain {
						vertical-align:top;
					}

					td.value.graphMain {
						vertical-align:bottom;
					}

          </style>
			</head>
			<body>
				<div class="page">
					<table border-collapse="separate" class="w180" style="width:25%">
						<td align="center">
							<xsl:for-each select="nGTDr:NotifGTDRegistration">
								<xsl:for-each select="nGTDr:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
									<xsl:text>.</xsl:text>
									<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
								</xsl:for-each>
							</xsl:for-each> 
						<xsl:for-each select="nGTDr:NotifGTDRegistration">
							<xsl:for-each select="nGTDr:RegistrationTime">
								<xsl:value-of select="substring(., 1, 8)"/>
							</xsl:for-each>
						</xsl:for-each> 
					</td>
					</table>
					<br/>
					<table class="w180">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<span style="font-weight:bold; ">
											<xsl:choose>
												<xsl:when test="//nGTDr:DocSign='0'">Уведомление<br/>о регистрации таможенной декларации</xsl:when>
												<xsl:when test="//nGTDr:DocSign='1'">Уведомление о регистрации<br/>Обязательства о подаче ДТ</xsl:when>
												<xsl:when test="//nGTDr:DocSign='2'">Уведомление о регистрации<br/>реестра экспресс-грузов</xsl:when>
												<xsl:when test="//nGTDr:DocSign='3'">Уведомление о регистрации сведений<br/>о поступлении товара на территорию УЭО</xsl:when>
												<xsl:when test="//nGTDr:DocSign='4'">Уведомление о регистрации<br/>заявления о выпуске до подачи</xsl:when>
												<xsl:when test="//nGTDr:DocSign='5'">Уведомление о регистрации<br/>заявления о совершении операций с ТСМП</xsl:when>
												<xsl:when test="//nGTDr:DocSign='6'">Заявление о зачете <br/>авансовых платежей</xsl:when>
												<xsl:when test="//nGTDr:DocSign='7'">Регистрация запроса на сканирование документа</xsl:when>
												<xsl:when test="//nGTDr:DocSign='8'">Регистрация Заявления о проведении идентификации товаров</xsl:when>
												<xsl:otherwise>Документ </xsl:otherwise>
											</xsl:choose>
										</span>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="//nGTDr:DocSign!='0'">
						<br/>
						<table class="w180" style="width:100%">
							<tr>
								<td align="center" style="width:20%">
									<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:Code"/>
								</td>
								<td align="center" style="width:80%">
									<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:OfficeName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<br/>
					<table class="w180">
						<tr>
							<td class="annot graphMain" style="width:100%">
								<span>
									<xsl:variable name="CustomsCode">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:CustomsCode"/>
									</xsl:variable>
									<xsl:variable name="RegistrationDate">
										<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:RegistrationDate,3,2)"/>
									</xsl:variable>
									<xsl:variable name="GTDNumber">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:GTDID/cat_ru:GTDNumber"/>
									</xsl:variable>
									<xsl:variable name="PrefixGTDNumber">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='4'">
												<!--xsl:value-of select="'ЗВ'"/-->
												<xsl:value-of select="'В'"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="''"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="AddNumber">
										<xsl:if test="nGTDr:NotifGTDRegistration/nGTDr:GTDID/nGTDr:AddNumber">
											<xsl:choose>
												<xsl:when test="nGTDr:NotifGTDRegistration/nGTDr:GTDID/nGTDr:AddNumber = 'ЗВ'">В</xsl:when>
												<xsl:otherwise><xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:GTDID/nGTDr:AddNumber"/></xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:variable>
									<xsl:variable name="RefDocumentID">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/cat_ru:RefDocumentID"/>
									</xsl:variable>
									<xsl:variable name="DocName">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='0'">
												<xsl:value-of select="'ДТ'"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'Документ'"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="LastChar1">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='0'">
												<xsl:value-of select="''"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="'а'"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="LastChar2">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='0'">
												<xsl:value-of select="'а'"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="''"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="FirstStrDT">
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign='0'">
											<xsl:text>Декларация с уникальным идентификатором: </xsl:text>
												<xsl:choose>
													<xsl:when test="nGTDr:NotifGTDRegistration/cat_ru:RefDocumentID">
														<xsl:value-of select="$RefDocumentID"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text> не указан</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
											<xsl:value-of select="$DocName"/>
											<xsl:choose>
												<xsl:when test="nGTDr:NotifGTDRegistration/cat_ru:RefDocumentID">
													<xsl:value-of select="concat(' (уникальный идентификатор ',$DocName,$LastChar1,': ',$RefDocumentID,')')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat(' (уникальный идентификатор ',$DocName,$LastChar1,' не указан)')"/>
												</xsl:otherwise>
											</xsl:choose>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="$FirstStrDT"/>
									<br/>
									<xsl:value-of select="concat('зарегистрирован',$LastChar2,' под № ')"/>
									<b>
										<!--xsl:value-of select="concat($CustomsCode,'/',$RegistrationDate,'/',$PrefixGTDNumber,$GTDNumber,$AddNumber)"/-->
										<xsl:choose>
											<xsl:when test="//nGTDr:DocSign != 5 and //nGTDr:DocSign != 6 and //nGTDr:DocSign != 8">
												<xsl:value-of select="concat($CustomsCode,'/',$RegistrationDate,'/',$AddNumber,$GTDNumber)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat($CustomsCode,'/',$RegistrationDate,'/',$GTDNumber,'/',$AddNumber)"/>
											</xsl:otherwise>
										</xsl:choose>
										
									</b>
								</span>
							</td>
						</tr>
					</table>
					<br/>
					<br/>
					<xsl:choose>
						<xsl:when test="//nGTDr:DocSign='0'">
							<table class="w180">
								<tr>
									<td class="value graphMain" style="width:75%" align="center">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:OfficeName"/>
									</td>
									<td class="nnot graphMain" style="width:10%"/>
									<td class="value graphMain" style="width:15%" align="center">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:Customs/cat_ru:Code"/>
									</td>
								</tr>
							</table>
							<table class="w180">
								<tr>
									<td class="annot graphMain" style="width:75%" align="center">Таможенный орган, принявший решение</td>
									<td class="nnot graphMain" style="width:10%"/>
									<td class="annot graphMain" style="width:15%" align="center">Код</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table class="w180">
								<tr>
									<td class="value graphMain" style="width:75%" align="center">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:PersonName"/>
									</td>
									<td class="nnot graphMain" style="width:10%"/>
									<td class="value graphMain" style="width:15%" align="center">
										<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:LNP"/>
										<xsl:if test="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="nGTDr:NotifGTDRegistration/nGTDr:CustomsPersonSignature/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</td>
								</tr>
							</table>
							<table class="w180">
								<tr>
									<td class="annot graphMain" style="width:75%" align="center">Уполномоченное должностное лицо таможенного органа</td>
									<td class="nnot graphMain" style="width:10%"/>
									<td class="annot graphMain" style="width:15%" align="center">ЛНП</td>
								</tr>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
