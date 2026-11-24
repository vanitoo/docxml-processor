<?xml version="1.0" encoding="UTF-8"?>
<!--Приказ ФТС России от 11.06.2019 г. № 949 "Об утверждении форм и порядка представления банками и иными кредитными организациями документов и сведений по запросам (требованиям) Таможенных органов"-->
<xsl:stylesheet exclude-result-prefixes="soa  cat_ru catComFin_ru" version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:soa="urn:customs.ru:Information:CommercialFinanceDocuments:StatementOfAccount:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="soa:StatementOfAccount">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Выписка со счета</title>
				<style type="text/css">
					body
					{text-align: center;
					background: #cccccc;}

					div.page
					{width: 297mm;
					height: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.bordered
					{border: solid 1pt #000000;
					padding-top:4pt;
					padding-bottom:4pt;
					font-family: Arial;
					font-size: 9pt;
					font-weight: bold;}

					.underlined
					{border-bottom: solid 0.8pt #000000;}

					p.NumberDate
					{font-weight: bold;
					}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					td
					{font-family:Courier;}

					.graphMain
					{font-family: Arial;
					font-size: 10pt;
					font-weight: bold;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					table.items
					{font-size: 10pt; border-collapse: collapse;}

                    table.items td, table.items th
                    {border: 1px solid black; padding: 2px;}

                    table.items th
                    {background-color: WhiteSmoke;}
				</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<!--tr>
								<td class="graph" style="width:227mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graph" style="width:40mm;">
									<xsl:text>Приложение №2</xsl:text>
									<br/>
									<xsl:text>к приказу ФТС России</xsl:text>
									<br/>
									<xsl:text>от 11 июня 2019 г. №949</xsl:text>
								</td>
							</tr-->
							<tr>
								<td align="center" class="graph" colspan="2">
									<h3>Выписка по операциям на счете<br/>организации (индивидуального предпринимателя)</h3>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									«<xsl:apply-templates select="soa:Bank/soa:OrganizationName"/>
									<xsl:if test="soa:Bank/soa:ShortName">
										<xsl:text> (</xsl:text>
										<xsl:apply-templates select="soa:Bank/soa:ShortName"/>
										<xsl:text>)</xsl:text>
									</xsl:if>»
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(полное или сокращенное наименование банка или иной кредитной организации в соответствии с</xsl:text><br/><xsl:text>Книгой государственной регистрации кредитных организаций, предусмотренной абзацем первым статьи 59</xsl:text><br/><xsl:text>Федерального закона от 10 июля 2002 г. №86-ФЗ «О Центральном банке Российской Федерации (Банке России)»)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">ИНН </td>
									 <xsl:for-each select="soa:Bank/soa:INN">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,10,1)"/>
										</td>
										<xsl:if test="substring(.,11)">
											<td style="width:3mm">
											   <xsl:value-of select="substring(.,11,1)"/>
											</td>
											<td style="width:3mm">
											   <xsl:value-of select="substring(.,12,1)"/>
											</td>
										</xsl:if>
									 </xsl:for-each>
								  </table>
							   </td>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">КПП </td>
									 <xsl:for-each select="soa:Bank/soa:KPP">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
									 </xsl:for-each>
								  </table>
							   </td>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">БИК </td>
									 <xsl:for-each select="soa:Bank/soa:BIC">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
									 </xsl:for-each>
								  </table>
							   </td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="5%"/>
								<td class="graph">В соответствии с запросом (требованием) таможенного органа</td>
								<td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:value-of select="soa:CustomsName/cat_ru:OfficeName"/>
								</td>
								<td align="center" class="graph">от</td>
								<td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:apply-templates select="soa:CustomsLetter/cat_ru:PrDocumentDate" mode="russian_date"/>
									<xsl:text> № </xsl:text>
									<xsl:value-of select="soa:CustomsLetter/cat_ru:PrDocumentNumber"/>
								</td>
								<td width="5%"/>
							</tr>
							<tr>
								<td/>
								<td/>
								<td align="center" class="graphLittle">
									<xsl:text>(наименование таможенного органа)</xsl:text>
								</td>
								<td/>
								<td align="center" class="graphLittle">
									<xsl:text>(дата и номер письма таможенного органа)</xsl:text>
								</td>
								<td/>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="5%"/>
								<td class="graph">в отношении</td>
							</tr>
							<tr>
								<td align="center" class="graph" colspan="2" style="border-bottom:solid 0.8pt #000000;">
									<xsl:choose>
										<xsl:when test="soa:AccountHolder/soa:VerifiedPersonYUL">
											«<xsl:apply-templates select="soa:AccountHolder/soa:VerifiedPersonYUL/soa:OrganizationName"/>
											<xsl:if test="soa:AccountHolder/soa:VerifiedPersonYUL/soa:ShortName">
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="soa:AccountHolder/soa:VerifiedPersonYUL/soa:ShortName"/>
												<xsl:text>)</xsl:text>
											</xsl:if>»
										</xsl:when>
										<xsl:when test="soa:AccountHolder/soa:VerifiedPersonFL">
											«<xsl:apply-templates select="soa:AccountHolder/soa:VerifiedPersonFL/soa:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="soa:AccountHolder/soa:VerifiedPersonFL/soa:PersonName"/>
											<xsl:if test="soa:AccountHolder/soa:VerifiedPersonFL/soa:PersonMiddleName">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="soa:AccountHolder/soa:VerifiedPersonFL/soa:PersonMiddleName"/>
											</xsl:if>»
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="2">
									<xsl:text>(полное наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">ИНН </td>
									 <xsl:for-each select="soa:AccountHolder/soa:INN">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,10,1)"/>
										</td>
										<xsl:if test="substring(.,11)">
											<td style="width:3mm">
											   <xsl:value-of select="substring(.,11,1)"/>
											</td>
											<td style="width:3mm">
											   <xsl:value-of select="substring(.,12,1)"/>
											</td>
										</xsl:if>
									 </xsl:for-each>
								  </table>
							   </td>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">КПП </td>
									 <xsl:for-each select="soa:AccountHolder/soa:KPP">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
									 </xsl:for-each>
								  </table>
							   </td>
							   <td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="5%"/>
								<td class="graph">представляет выписку по счету</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
							   <td class="graph">
								  <table class="items">
									 <td class="graph">№</td>
									 <xsl:for-each select="soa:Account">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,4,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,5,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,6,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,7,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,8,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,9,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,10,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,11,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,12,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,13,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,14,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,15,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,16,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,17,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,18,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,19,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,20,1)"/>
										</td>
									 </xsl:for-each>
								  </table>
							   </td>
							   <td align="center" class="graph">
								  <table class="items">
									 <xsl:for-each select="soa:AccountCurrency">
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,1,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,2,1)"/>
										</td>
										<td style="width:3mm">
										   <xsl:value-of select="substring(.,3,1)"/>
										</td>
									 </xsl:for-each>
								  </table>
							   </td>
							</tr>
							<xsl:if test="soa:AccountCurrency">
								<tr>
									<td/>
									<td align="center" class="graphLittle">
										<xsl:text>(цифровой код валюты счета (в соответствии с Общероссийским классификатором валют))</xsl:text>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="5%"/>
								<td class="graph">за период с</td>
								<td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:apply-templates select="soa:Term/soa:BeginDate" mode="russian_date"/>
								</td>
								<td align="center" class="graph">по</td>
								<td align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:apply-templates select="soa:Term/soa:EndDate" mode="russian_date"/>
								</td>
								<td class="graph" width="55%">.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td align="right" class="graph">
									<xsl:text>Таблица</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td class="graph" colspan="9" style="width:267mm;">
									<table border="1" cellpadding="3" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td align="center" rowspan="2" class="graph">
													<xsl:text>№ п/п</xsl:text>
												</td>
												<td align="center" rowspan="2" class="graph">
													<xsl:text>Дата совершения операции (дд.мм.гг)</xsl:text>
												</td>
												<td align="center" colspan="3" class="graph">
													<xsl:text>Реквизиты документа, на основании которого была совершена операция по счету</xsl:text>
												</td>
												<td align="center" colspan="3" class="graph">
													<xsl:text>Реквизиты банка или иной кредитной организации плательщика/получателя денежных средств</xsl:text>
												</td>
												<td align="center" colspan="4" class="graph">
													<xsl:text>Реквизиты плательщика/получателя денежных средств</xsl:text>
												</td>
												<td align="center" colspan="2" class="graph">
													<xsl:text>Сумма операции по счету</xsl:text>
												</td>
												<td align="center" rowspan="2" class="graph">
													<xsl:text>Назначение платежа</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="center" class="graph">
													<xsl:text>вид (шифр)</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>номер</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>дата (указывается при наличии)</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>номер корреспондентского счета</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>наименование</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>БИК</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>наименование/ фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>ИНН</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>КПП</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>номер счета</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>по дебету</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>по кредиту</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="center" class="graph">
													<xsl:text>1</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>2</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>3</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>4</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>5</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>6</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>7</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>8</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>9</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>10</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>11</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>12</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>13</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>14</xsl:text>
												</td>
												<td align="center" class="graph">
													<xsl:text>15</xsl:text>
												</td>
											</tr>
											<xsl:for-each select="soa:TransInfo">
												<tr>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:TransNumber"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:TransDate" mode="russian_date"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:AccDocNo/soa:PrDocumentKind"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:AccDocNo/soa:PrDocumentNumber"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:AccDocNo/soa:PrDocumentDate" mode="russian_date"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:CounterpartyBank/soa:CorrAccBrf"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:CounterpartyBank/soa:BankOrganizationName"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:CounterpartyBank/soa:BICCorr"/>
													</td>
													<td align="center" class="graph">
														<xsl:choose>
															<xsl:when test="soa:Counterparty/soa:VerifiedPersonYUL">
																<xsl:apply-templates select="soa:Counterparty/soa:VerifiedPersonYUL/soa:OrganizationName"/>
																<xsl:if test="soa:Counterparty/soa:VerifiedPersonYUL/soa:ShortName">
																	<xsl:text> (</xsl:text>
																	<xsl:apply-templates select="soa:Counterparty/soa:VerifiedPersonYUL/soa:ShortName"/>
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</xsl:when>
															<xsl:when test="soa:Counterparty/soa:VerifiedPersonFL">
																<xsl:apply-templates select="soa:Counterparty/soa:VerifiedPersonFL/soa:PersonSurname"/>
																<xsl:text> </xsl:text>
																<xsl:apply-templates select="soa:Counterparty/soa:VerifiedPersonFL/soa:PersonName"/>
																<xsl:if test="soa:Counterparty/soa:VerifiedPersonFL/soa:PersonMiddleName">
																	<xsl:text> </xsl:text>
																	<xsl:apply-templates select="soa:Counterparty/soa:VerifiedPersonFL/soa:PersonMiddleName"/>
																</xsl:if>
															</xsl:when>
														</xsl:choose>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:Counterparty/soa:INN"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:Counterparty/soa:KPP"/>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:Counterparty/soa:PersonalAccount"/>
													</td>
													<td align="center" class="graph">
														<xsl:if test="soa:DC=1">
															<xsl:apply-templates select="soa:Amount"/>
														</xsl:if>
														<xsl:if test="soa:DC!=1">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</td>
													<td align="center" class="graph">
														<xsl:if test="soa:DC=2">
															<xsl:apply-templates select="soa:Amount"/>
														</xsl:if>
														<xsl:if test="soa:DC!=2">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</td>
													<td align="center" class="graph">
														<xsl:apply-templates select="soa:PaymentPurpose"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td class="graph">Приложение: заверенные копии платежных документов, подтверждающих совершение операций на счетах организаций (индивидуальных предпринимателей) на <u>&#160;&#160;&#160;<xsl:apply-templates select="soa:Sheets"/>&#160;&#160;&#160;</u> л. в 1 экз.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td width="30%" class="graph">Представитель банка (кредитной организации)</td>
								<td width="2,5%"/>
								<td width="15%" align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:value-of select="soa:RepresentativeBankPerson/cat_ru:PersonPost"/>
								</td>
								<td width="2,5%"/>
								<td width="15%" align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:value-of select="soa:RepresentativeBankPerson/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(soa:RepresentativeBankPerson/cat_ru:PersonName,1,1)"/>
									<xsl:text>.</xsl:text>
									<xsl:if test="soa:RepresentativeBankPerson/cat_ru:PersonMiddleName">
										<xsl:value-of select="substring(soa:RepresentativeBankPerson/cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>.</xsl:text>
									</xsl:if>
								</td>
								<td width="2,5%"/>
								<td width="15%" style="border-bottom:solid 0.8pt #000000;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td width="2,5%"/>
								<td width="15%" align="center" class="graph" style="border-bottom:solid 0.8pt #000000;">
									<xsl:apply-templates select="soa:RepresentativeBankPerson/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td/>
								<td width="5%"/>
								<td align="center" class="graphLittle">
									<xsl:text>(должность)</xsl:text>
								</td>
								<td/>
								<td align="center" class="graphLittle">
									<xsl:text>(фамилия, инициалы имени и отчества (при наличии))</xsl:text>
								</td>
								<td/>
								<td align="center" class="graphLittle">
									<xsl:text>(подпись)</xsl:text>
								</td>
								<td/>
								<td align="center" class="graphLittle">
									<xsl:text>(дата)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

   <xsl:template match="/">
      <xsl:apply-templates/>
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
	<xsl:template match="//*[local-name()='StatementOfAccount']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
</xsl:stylesheet>