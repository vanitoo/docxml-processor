<?xml version="1.0" encoding="UTF-8"?>
<!--
Приказ ФТС от 10.01.2019 № 7 отменяет действие приказа ФТС от 22.12.2010 № 2520.
Но вступает в силу приказ ФТС от 10.01.2019 № 7 не ранее даты применения статей 35 и 36 ФЗ от 03.08.2018 № 289-ФЗ.
А статьи 35 и 36 ФЗ от 03.08.2018 № 289-ФЗ применяются со дня вступления в силу международного договора Российской Федерации, предусматривающего внесение изменений в приложения № 5 и 8 к Договору о Союзе. Эта дата ещё неизвестна.

Мало того, приказ ФТС от 22.12.2010 № 2520 содержит три формы, созданные на основании ФЗ от 27.11.2010 № 311-ФЗ:
ст. 122 п.1 - Заявление о возврате авансовых платежей; 
ст. 147 - Заявление о возврате (зачете) излишне уплаченных или излишне взысканных сумм таможенных пошлин, налогов и иных денежных средств;
ст. 149 - Заявление о возврате (зачете) денежного залога

Приказ ФТС от 10.01.2019 № 7 содержит только форму "Заявление о возврате авансовых платежей", которая сделана на основании   
ст. 36 ФЗ от 03.08.2018 № 289-ФЗ.
Других форм (на основании ст. 147 и 149 ФЗ от 27.11.2010 № 311-ФЗ), присутствующих в приказе ФТС от 22.12.2010 № 2520, в приказе, отменяющем его действие, нет.
Т.е. нет форм, которые должны быть созданы на основании ст. 67 и 69 ФЗ от 03.08.2018 № 289-ФЗ.

CashType = 1
Приказ ФТС России от 10 января 2019 года № 7
Приложение № 1 - Заявление о возврате авансовых платежей

CashType = 2
Приказ ФТС России от 22 декабря 2010 г. № 2520 с изменениями по Приказу ФТС России № 831 от 2 мая 2012 года 
Приложение № 2 - Заявление о возврате (зачете) излишне уплаченных или излишне взысканных сумм таможенных пошлин, налогов и иных денежных средств

CashType = 3
Приказ ФТС России от 22 декабря 2010 г. № 2520 с изменениями по Приказу ФТС России № 831 от 2 мая 2012 года 
Приложение № 3 - Заявление о возврате (зачете) денежного залога
-->
<xsl:stylesheet exclude-result-prefixes="cat_ru arcc" version="1.0" xmlns:arcc="urn:customs.ru:Information:CommercialFinanceDocuments:ApplicationReturnCreditingCash:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template name="Date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/> 
		<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
		<xsl:value-of select="substring($dateIn, 1, 4)"/> г.
	</xsl:template>
	<xsl:template name="Date_2">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 3, 2)"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--xsl:variable name="type" select="arcc:ReturnCrediting"/-->
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="arcc:ApplicationReturnCreditingCash">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
			body {
			background: #cccccc;
			font-family: Arial;
			}
                    div.page {
                        width: 180mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    
                    .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.value
					{
					  border-bottom: solid 1px black;
					  font-family: Arial;
					  font-size: 11pt;
					  font-style: italic;
					}
                    </style>
			<body>
				<xsl:variable name="vozvrzach">
					<xsl:if test="arcc:ReturnCrediting = 0">возврат</xsl:if>
					<xsl:if test="arcc:ReturnCrediting = 1">зачет</xsl:if>
				</xsl:variable>
				<div class="page">
					<xsl:choose>
						<xsl:when test="arcc:CashType='1'">
							<table width="100%">
								<tbody>
									<tr>
										<td width="50%"/>
										<td width="50%">
											<table>
												<tbody>
													<tr valign="top">
														<td width="3%">В</td>
														<td align="center" class="underlined">
															<xsl:apply-templates select="arcc:Customs"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td class="graph8">(наименование таможенного органа Российской Федерации<sup>1</sup>)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr align="center">
										<td>
											<b><xsl:text>Заявление о возврате авансовых платежей</xsl:text></b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="35%">
											<table class="inlinetable" style="min-width: 100%; width: 100%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:call-template name="Date">
																<xsl:with-param name="dateIn" select="arcc:RegistrationReq/cat_ru:PrDocumentDate"/>
															</xsl:call-template>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(дата заявления)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="30%"></td>
										<td width="35%">
											<xsl:text>№ </xsl:text>
											<table class="inlinetable" style="min-width: 90%; width: 90%;">
												<tbody>
													<tr align="center">
														<td class="value">
															<xsl:apply-templates select="arcc:RegistrationReq/cat_ru:PrDocumentNumber"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															(номер заявления)
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td class="underlined">
											<xsl:value-of select="arcc:ApplicantInfo/RUScat_ru:OrganizationName"/>
											<xsl:if test="not(arcc:ApplicantInfo/RUScat_ru:OrganizationName) and arcc:ApplicantInfo/RUScat_ru:ShortName">
												<xsl:value-of select="arcc:ApplicantInfo/RUScat_ru:ShortName"/>
											</xsl:if>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица, подавшего заявление)</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:text>дата рождения физического лица: </xsl:text>
							<table class="inlinetable" style="width: 50mm;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:call-template name="Date">
												<xsl:with-param name="dateIn" select="arcc:ApplicantInfo/arcc:Birthdate"/>
											</xsl:call-template>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(число, месяц, год)
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<xsl:text>документ, удостоверяющий личность физического лица: </xsl:text>
							<table class="inlinetable" style="width: 100%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="arcc:ApplicantInfo/arcc:IdentityCard"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(наименование, серия, номер, страна выдачи, дата выдачи документа)
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:text>Идентификационный номер налогоплательщика, код причины постановки на учет</xsl:text>
							<table class="inlinetable" style="width: 100%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="arcc:ApplicantInfo/RUScat_ru:RFOrganizationFeatures"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(для лиц, состоящих на учете в налоговых органах Российской Федерации)
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:text>или наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации</xsl:text>
							<table class="inlinetable" style="width: 100%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="arcc:ApplicantInfo" mode="IINorAnalog"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(для лиц, не состоящих на учете в налоговых органах Российской Федерации)
										</td>
									</tr>
								</tbody>
							</table>
							
							<table width="100%">
								<tbody>
									<tr>
										<td style="text-align:justify;">
											<xsl:text>в соответствии со статьей 36 Федерального  закона</xsl:text><sup>2</sup><xsl:text> просит вернуть денежные средства в размере</xsl:text>
											<xsl:apply-templates select="arcc:AmountCash[1]/arcc:Amount"/>
											<xsl:text>, распределенные (зачтенные) на лицевой счет по коду бюджетной классификации </xsl:text>
											<span style="display: inline-block; width: 100%; border-bottom: 1px solid black; text-align: center;">
												<xsl:apply-templates select="arcc:AmountCash[1]/arcc:BCC"/>
											</span>
											<xsl:text>по одному из следующих реквизитов: </xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>на банковский счет:</td>
									</tr>
									<tr>
										<td>
											<xsl:text>банковский идентификационный код кредитной организации </xsl:text>
											<xsl:if test="not(arcc:BankInformation/arcc:SeparateBankAccountSign) or arcc:BankInformation/arcc:SeparateBankAccountSign = 0 or translate(substring(arcc:BankInformation/arcc:SeparateBankAccountSign, 1, 1), 'f', 'F') = 'F'">
												<xsl:apply-templates select="arcc:BankInformation/cat_ru:BICID"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>номер банковского счета </xsl:text>
											<xsl:if test="not(arcc:BankInformation/arcc:SeparateBankAccountSign) or arcc:BankInformation/arcc:SeparateBankAccountSign = 0 or translate(substring(arcc:BankInformation/arcc:SeparateBankAccountSign, 1, 1), 'f', 'F') = 'F'">
												<xsl:apply-templates select="arcc:BankInformation/cat_ru:BankAccount" mode="splitComma"/>
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>на отдельный счет, открытый в уполномоченном банке для осуществления расчетов по государственному оборонному заказу (далее – отдельный счет):</td>
									</tr>
									<tr>
										<td>
											<xsl:text>банковский идентификационный код кредитной организации </xsl:text>
											<xsl:if test="arcc:BankInformation/arcc:SeparateBankAccountSign = 1 or translate(substring(arcc:BankInformation/arcc:SeparateBankAccountSign, 1, 1), 't', 'T') = 'T'">
												<xsl:apply-templates select="arcc:BankInformation/cat_ru:BICID"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>номер отдельного счета </xsl:text>
											<xsl:if test="arcc:BankInformation/arcc:SeparateBankAccountSign = 1 or translate(substring(arcc:BankInformation/arcc:SeparateBankAccountSign, 1, 1), 't', 'T') = 'T'">
												<xsl:apply-templates select="arcc:BankInformation/cat_ru:BankAccount" mode="splitComma"/>
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>на национальный платежный инструмент:</td>
									</tr>
									<tr>
										<td>
											<xsl:text>реквизиты национального платежного инструмента, с использованием которого осуществляются операции по банковскому счету </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:NationalPaymentInstrument"/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
								<tbody>
									<tr>
										<td>на казначейский счет:</td>
									</tr>
									<tr>
										<td>
											<xsl:text>номер единого казначейского счета </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:SingleTreasuryAccountMunber"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>номер казначейского счета </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:TreasuryAccountMunber"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>код бюджетной классификации </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:CodeBC"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>лицевой счет </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:OrganizationAccount"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>общероссийский классификатор территорий муниципальных образований </xsl:text>
											<xsl:apply-templates select="arcc:BankInformation/arcc:MunicipalTerritoriesClassif"/>
										</td>
									</tr>
								</tbody>
							</table>
							
							<br/>
							<br/>
							<br/>
							<table>
								<tbody>
									<tr align="center" valign="bottom">
										<td width="45%"></td>
										<td width="10%"></td>
										<td width="45%">
											<xsl:apply-templates select="arcc:ApplicantSignature/*[contains(local-name(), 'ame')]" mode="splitSpace"/>
										</td>
									</tr>
									<tr>
										<td class="descr" style="border-top: 1px solid black;">(подпись руководителя организации или уполномоченного от имени организации лица либо индивидуального предпринимателя или физического лица)</td>
										<td></td>
										<td class="descr" style="border-top: 1px solid black;">фамилия, имя, отчество (при наличии)</td>
									</tr>
								</tbody>
							</table>
							
							<br/>
							<div class="underlined" style="width:50mm;"/>
							<br/>
							<table width="100%">
								<tbody style="text-align:justify;">
									<tr>
										<td class="graph8">
											<sup>1</sup><xsl:text> Далее - таможенный орган.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8">
											<sup>2</sup><xsl:text> Федеральный закон от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (далее - Федеральный закон).</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graph8">
											<sup>3</sup><xsl:text> Части 5, 6 статьи 36 Федерального закона.</xsl:text>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise> <!--<xsl:when test="arcc:CashType='1'">-->
							<table width="100%">
								<tbody>
									<tr>
										<td width="50%"/>
										<td width="50%">
											<table>
												<tbody>
													<tr valign="top">
														<td>Начальнику</td>
														<td align="center" class="underlined">
															<xsl:value-of select="arcc:Customs/cat_ru:OfficeName"/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td class="graph8">(наименование таможенного органа)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<table width="100%">
								<tbody>
									<tr align="center">
										<td>
											<xsl:if test="arcc:CashType=1">
												Заявление о возврате авансовых платежей
											</xsl:if>
											<xsl:if test="arcc:CashType=2">
												Заявление о <xsl:value-of select="$vozvrzach"/>е излишне уплаченных или излишне взысканных<br/>сумм таможенных пошлин, налогов и иных денежных средств
											</xsl:if>
											<xsl:if test="arcc:CashType=3">
												Заявление о <xsl:value-of select="$vozvrzach"/>е денежного залога
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td class="underlined">
											<xsl:apply-templates mode="organization" select="arcc:ApplicantInfo"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(наименование, ИНН, КПП, адрес организации или инициалы, фамилия, адрес физического лица)</td>
									</tr>
								</tbody>
							</table>
							<xsl:if test="arcc:CashType=1">
								<table width="100%">
									<tbody>
										<tr>
											<td>
												в соответствии со статьей 122 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть
												 по коду бюджетной классификации платежных документов на банковский счет 
												<xsl:apply-templates select="arcc:BankInformation"/> авансовые платежи, внесенные по платежным документам
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:for-each select="arcc:PaymentDocument">
													<xsl:apply-templates select="." mode="document"/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td class="graph8" align="center">(указываются номер, дата и сумма платежного документа)</td>
										</tr>
									</tbody>
								</table>
								<table width="100%">
									<tbody>
										<tr>
											<td style="width:25mm;">в связи с</td>
											<td class="underlined">
												<xsl:value-of select="arcc:ReasonReturningCrediting"/>
											</td>
										</tr>
										<tr align="center">
											<td/>
											<td class="graph8">(указывается основание для возврата, в том числе ошибочное перечисление)</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="arcc:CashType=2">
								<table width="100%">
									<tbody>
										<tr>
											<td>
												<xsl:text>в соответствии со статьями 129, 147, 148 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть по коду бюджетной классификации платежных документов на банковский счет </xsl:text>
												<xsl:apply-templates select="arcc:BankInformation"/>
												<xsl:text> либо зачесть в счет исполнения обязанностей по уплате  таможенных платежей, пеней, процентов по документу </xsl:text>
												<xsl:apply-templates mode="document" select="arcc:DocPaymentOfCustoms"/>
												<xsl:text> таможенные платежи, внесенные </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:apply-templates mode="organization" select="arcc:PayerInfo"/>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указывается наименование, организационно-правовая форма организации или инициалы, фамилия физического лица, внесшего таможенные платежи)</td>
										</tr>
										<tr>
											<td>
												по платежным документам
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:for-each select="arcc:PaymentDocument">
													<xsl:apply-templates select="." mode="document"/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указываются номер, дата и сумма платежного документа)</td>
										</tr>
										<tr>
											<td>
												и исчисленные
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:apply-templates select="arcc:DocCalcPayment" mode="document"/>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указывается номер документа, в соответствии с которым исчислялись таможенные платежи)</td>
										</tr>
									</tbody>
								</table>
								<table width="100%">
									<tbody>
										<tr>
											<td style="width:25mm;">в связи с</td>
											<td class="underlined">
												<xsl:value-of select="arcc:ReasonReturningCrediting"/>
											</td>
										</tr>
										<tr align="center">
											<td/>
											<td class="graph8">(указывается факт, в соответствии с которым исчислялись таможенные платежи)</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="arcc:CashType=3">
								<table width="100%">
									<tbody>
										<tr>
											<td>
												<xsl:text>в соответствии со статьей 149 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть по коду бюджетной классификации платежных документов на банковский счет </xsl:text>
												<xsl:apply-templates select="arcc:BankInformation"/>
												<xsl:text> либо зачесть в счет авансовых платежей </xsl:text>
												<xsl:value-of select="arcc:ConditionCrediting"/>
												<xsl:text> денежный залог, внесенный по платежным документам </xsl:text>
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:for-each select="arcc:PaymentDocument">
													<xsl:apply-templates select="." mode="document"/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указываются номер, дата и сумма платежного документа)</td>
										</tr>
										<tr>
											<td>
												и исчисленный
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:apply-templates select="arcc:CustomsReceipt" mode="document"/>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указывается номер таможенный расписки, в соответствии с которой исчиялялся денежный залог)</td>
										</tr>
										<tr>
											<td>
												в связи с исполнением (прекращением) обязательства, обеспеченного денежным залогом, что подтверждается
											</td>
										</tr>
										<tr>
											<td class="underlined">
												<xsl:for-each select="arcc:DocConfCease">
													<xsl:apply-templates select="." mode="document"/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr align="center">
											<td class="graph8">(указываются документы, подтверждающие исполнение (прекращение) обязательства, обеспеченного денежным залогом)</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<table width="100%">
								<tbody>
									<tr>
										<td style="width:25mm;">в размере</td>
										<td class="underlined">
											<xsl:for-each select="arcc:AmountCash">
												<br>
													<xsl:if test="arcc:BCC">
														<xsl:text>КБК: </xsl:text>
														<xsl:value-of select="arcc:BCC"/>&#160;</xsl:if>
													<xsl:if test="arcc:PaymentModeCode">(<xsl:value-of select="arcc:PaymentModeCode"/>)&#160;</xsl:if>
													<xsl:value-of select="arcc:Amount"/>
													<xsl:if test="arcc:Currency">
														<xsl:text> (</xsl:text>
														<xsl:value-of select="arcc:Currency"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
													<xsl:if test="position()!=last()">,&#160;</xsl:if>
												</br>
											</xsl:for-each>
										</td>
									</tr>
									<tr align="center">
										<td/>
										<td class="graph8">(сумма денежных средств к возврату)</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr valign="top">
										<td width="35%">Перечень прилагаемых документов</td>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td>1)</td>
														<td class="underlined">
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td class="graph8">
															(указываются документы, прилагаемые к заявлению)
														</td>
													</tr>
													<tr>
														<td>2)</td>
														<td class="underlined">
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											Настоящим заявляю, что в данный таможенный орган ранее представлялись следующие документы:
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="top">
														<td>1)</td>
														<td class="underlined">
															<xsl:for-each select="arcc:AttachedDocuments">
																<xsl:apply-templates mode="document" select="."/>
																<xsl:if test="position()!=last()">; </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr align="center">
														<td/>
														<td class="graph8">(указываются документы из предусмотренных частями 4 - 7 статьи 122 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" и наименование и реквизиты документов, при подаче которых в данный таможенный орган представлялись поименованные документы)</td>
													</tr>
													<tr valign="top">
														<td>2)</td>
														<td class="underlined">
															<xsl:for-each select="arcc:GTDID">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">; </xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											и в них отсутствуют изменения.
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td width="40%" class="underlined"/>
										<td width="20%"/>
										<td width="40%" align="center" class="underlined">
											<xsl:apply-templates select="arcc:ApplicantSignature"/>
										</td>
									</tr>
									<tr valign="top" align="center">
										<td class="graph8">(подпись руководителя организации или уполномоченного от имени организации лица либо физического лица)</td>
										<td/>
										<td class="graph8">(инициалы, фамилия)</td>
									</tr>
									<tr>
										<td>
											<xsl:call-template name="Date">
												<xsl:with-param name="dateIn" select="arcc:ApplicantSignature/cat_ru:IssueDate"/>
											</xsl:call-template>
										</td>
										<td/>
										<td/>
									</tr>
									<tr>
										<td>
											М.П.<sup>1</sup>
										</td>
										<td/>
										<td/>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<div class="underlined" style="width:50mm;"/>
							<br/>
							<span class="graph8">
								<sup>1</sup>Если в соответствии с законодательством Российской Федерации лицо, подавшее заявление, должно иметь печать.
							</span>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="arcc:Amount">
			
			<xsl:variable name="rub">
				<xsl:choose>
					<xsl:when test="string-length(substring-before(., '.')) = 0">0</xsl:when>
					<xsl:otherwise><xsl:value-of select="substring-before(., '.')"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="kop">
				<xsl:choose>
					<xsl:when test="string-length(substring-after(., '.')) = 0">00</xsl:when>
					<xsl:otherwise><xsl:value-of select="substring-after(., '.')"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
				
			<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align: center;">
				<xsl:value-of select="format-number($rub, '0')"/>
			</span>
			<xsl:text> рублей </xsl:text>
			<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align: center;">
				<xsl:value-of select="format-number($kop, '00')"/>
			</span>
			<xsl:text> копеек</xsl:text>		
			
	</xsl:template>
	
	<xsl:template match="arcc:ApplicantInfo" mode="IINorAnalog">
		<xsl:apply-templates select="*[local-name() = 'CountryA2Code']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RKOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RBOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'RAOrganizationFeatures']"/>
		<xsl:apply-templates select="*[local-name() = 'KGOrganizationFeatures']"/>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'KGOrganizationFeatures']">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН/ПИН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RAOrganizationFeatures']">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RBOrganizationFeatures']">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> УНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="*[local-name() = 'RKOrganizationFeatures']">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="arcc:BankInformation">
		<xsl:value-of select="cat_ru:BankName"/>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text> номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> тип счета: </xsl:text>
			<xsl:apply-templates select="cat_ru:BankAccountDescription"/>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
			<xsl:text> МФО </xsl:text>
			<xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text> ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК </xsl:text>
			<xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> корр.счет </xsl:text>
			<xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text> валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text> валютный счет (специальный транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="arcc:OKTMO">
			<xsl:text> ОКТМО: </xsl:text>
			<xsl:value-of select="arcc:OKTMO"/>
		</xsl:if>
		<xsl:if test="arcc:OrganizationAccount">
			<xsl:text> лицевой счет: </xsl:text>
			<xsl:value-of select="arcc:OrganizationAccount"/>
		</xsl:if>
		<xsl:if test="arcc:CodeBC">
			<xsl:text> код по БК: </xsl:text>
			<xsl:value-of select="arcc:CodeBC"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="arcc:ApplicantSignature">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="arcc:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="Date_2">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="arcc:PaymentModeCode">
			<xsl:text> код платежа </xsl:text>
			<xsl:value-of select="arcc:PaymentModeCode"/>
		</xsl:if>
		<xsl:if test="arcc:Amount">
			<xsl:text> сумма </xsl:text>
			<xsl:value-of select="arcc:Amount"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="*[local-name() = 'OrganizationName']"/>
		<xsl:if test="not(*[local-name() = 'OrganizationName']) and *[local-name() = 'ShortName']">
			<xsl:value-of select="*[local-name() = 'ShortName']"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RFOrganizationFeatures']"/>
		<xsl:if test="string-length(*[local-name() = 'OrganizationName']) &gt; 0 or string-length(*[local-name() = 'ShortName']) &gt; 0">
			<span>,&#160;</span>
		</xsl:if>
		<xsl:apply-templates select="arcc:IdentityCard"/>
		<xsl:if test="string-length(arcc:IdentityCard) &gt; 0 or string-length(*[local-name() = 'RFOrganizationFeatures']) &gt; 0">
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="arcc:Birthdate">дата рождения: <xsl:call-template name="Date">
				<xsl:with-param select="arcc:Birthdate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="arcc:OKSM">(<xsl:value-of select="arcc:OKSM"/>)</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Address']" mode="Address"/>
		<xsl:if test="arcc:OKTMO">
			<xsl:if test="string-length(*[local-name() = 'Address']) &gt; 0 or string-length(*[local-name() = 'Birthdate']) &gt; 0 or string-length(*[local-name() = 'RFOrganizationFeatures']) &gt; 0">
				<xsl:text>,&#160;</xsl:text>
			</xsl:if> ОКТМО:<xsl:value-of select="arcc:OKTMO"/>
		</xsl:if>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="arcc:IdentityCard">
		<!--xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if-->
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="italic">, страна</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="Date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="*[local-name() = 'RFOrganizationFeatures']">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="arcc:Customs|arcc:PrevCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
