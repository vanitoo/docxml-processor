<?xml version="1.0" encoding="UTF-8"?>
<!--Письмо ФТС от 31.10.19 № 06-112/67034,
Приложение № 3, Временное соглашение от 17.05.2018 "Временное соглашение, ведущее к образованию зоны свободной торговли между 
Евразийским экономическим союзом и его государствами - членами, с одной стороны, и Исламской Республикой Иран, с другой стороны"
-->
<xsl:stylesheet exclude-result-prefixes="sst3 cat_ru catSert_ru" version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:catSert_ru="urn:customs.ru:Information:SertifDocuments:SertifCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:sst3="urn:customs.ru:Information:SertifDocuments:SertifST3Form:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template match="//*[local-name()='SertifST3Form']//*" priority="-1">
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
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="sst3:SertifST3Form">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Сертификат о происхождении товаров формы СТ-3</title>
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
						}
						
				</style>
			</head>
			<body>
				<div class="page">
					<table width="100%" class="graph">
						<tbody>
							<tr>
								<td width="14%"/>
								<td width="12%"/>
								<td width="9%"/>
								<td width="15%"/>
								<td width="4%"/>
								<td width="7%"/>
								<td width="12%"/>
								<td width="12%"/>
								<td width="15%"/>
							</tr>
							<tr>
								<td colspan="4"/>
								<td colspan="5"/>
							</tr>
							<tr>
								<td colspan="4" class="graph bordered" width="50%" valign="middle">
									<span class="graphNo">1. </span>
									<span class="graph">Экспортер (наименование компании, адрес и страна)</span>
									<br/>
									<br/>
								</td>
								<td colspan="5" align="left" class="bordered" width="50%" valign="top">
									<span class="graphNo">4. </span>
									<span class="graph">№ </span>
									<xsl:choose>
										<xsl:when test="sst3:RegNumber">
											<span class="underlined value">
												<xsl:apply-templates select="sst3:RegNumber"/>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>_______</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="bordered value">
									<br/>
									<xsl:apply-templates select="sst3:Exporter"/>
									<br/>
								</td>
								<td colspan="5" class="border_vertical" valign="top" align="center">
									<br/>
									<xsl:text>EAEU-IRAN FTA</xsl:text>
									<br/>
									<br/>
									<xsl:text>Сертификат о происхождении товара</xsl:text>
									<br/>
									<br/>
									<xsl:text>формы СТ-3</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="bordered" valign="top">
									<span class="graphNo">2 </span>
									<span class="graph">Импортер (наименование копании, адрес и страна)</span>
									<br/>
									<br/>
									<span class="value">
										<xsl:apply-templates select="sst3:Importer"/>
										<br/>
									</span>
									<xsl:if test="sst3:Recipient">
										<span class="graph">
											<xsl:text>Получатель</xsl:text>
										</span>
										<br/>
										<span class="value">
											<xsl:apply-templates select="sst3:Recipient"/>
											<br/>
										</span>
									</xsl:if>
								</td>
								<td class="border_vertical" colspan="5" valign="top">
									<table>
										<tbody>
											<tr>
												<td class="graph" width="20%">
													<xsl:text>Выдан в</xsl:text>
												</td>
												<td align="center" width="30%" valign="bottom" class="value underlined">
													<xsl:apply-templates select="sst3:IssueCountryName"/>
												</td>
											</tr>
											<tr>
												<td class="graph">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle">
													<xsl:text>(страна)</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graph">
													<xsl:text>Для предоставления в</xsl:text>
												</td>
												<td align="center" valign="bottom" class="value underlined">
													<xsl:apply-templates select="sst3:DestinCountryName"/>
												</td>
											</tr>
											<tr>
												<td class="graph">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle">
													<xsl:text>(наименование страны)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="graph bordered" valign="top">
									<span class="graphNo">3. </span>
									<span class="graph">Средства транспорта и маршрут следования (насколько это известно)</span>
									<br/>
									<br/>
									<span class="value">
										<xsl:for-each select="sst3:TransportMeansRoute">
											<xsl:apply-templates mode="TransportMeans" select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
											<br/>
											<xsl:text> </xsl:text>
										</xsl:for-each>
									</span>
									<xsl:if test="not(sst3:TransportMeansRoute)">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<br/>
										<br/>
									</xsl:if>
								</td>
								<td colspan="5" class="graph bordered" valign="top">
									<span class="graphNo">5. </span>
									<span class="graph">Для служебных отметок</span>
									<br/>
									<br/>
									<span class="value">
										<xsl:choose>
											<xsl:when test="sst3:SertificatKindInfo/sst3:SertificatKind='1' or sst3:SertificatKindInfo/sst3:SertificatKind='2'">
												<xsl:choose>
													<xsl:when test="sst3:SertificatKindInfo/sst3:SertificatKind='1'">
														<xsl:text>DUPLICATE OF THE CERTIFICATE OF ORIGIN NUMBER </xsl:text>
													</xsl:when>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="sst3:SertificatKindInfo/sst3:SertificatKind='2'">
														<xsl:text>ISSUED IN SUBSTITUTION FOR THE CERTIFICATE OF ORIGIN NUMBER </xsl:text>
													</xsl:when>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="sst3:SertificatKindInfo/sst3:Number">
														<span class="value underlined">
															<xsl:apply-templates select="sst3:SertificatKindInfo/sst3:Number"/>
														</span>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>____ </xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text> DATE </xsl:text>
												<xsl:choose>
													<xsl:when test="sst3:SertificatKindInfo/sst3:Date">
														<span class="value underlined">
															<xsl:apply-templates select="sst3:SertificatKindInfo/sst3:Date" mode="russian_date"/>
														</span>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>____ </xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:when test="sst3:SertificatKindInfo/sst3:SertificatKind='3'">
												<xsl:text>ISSUED RETRO ACTIVELY</xsl:text>
											</xsl:when>
										</xsl:choose>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph bordered" valign="top">
									<span class="graphNo">6. </span>
									<span class="graph">
										<xsl:text>Номер наименования</xsl:text>
									</span>
								</td>
								<td colspan="2" align="center" class="graph bordered" valign="top">
									<span class="graphNo">7. </span>
									<span class="graph">Количество и вид упаковки</span>
								</td>
								<td colspan="2" align="center" class="graph bordered" valign="top">
									<span class="graphNo">8. </span>
									<span class="graph">Описание товара</span>
								</td>
								<td colspan="2" align="center" class="graph bordered" valign="top">
									<span class="graphNo">9. </span>
									<span class="graph">Критерий происхождения</span>
								</td>
								<td align="center" class="graph bordered" valign="top">
									<span class="graphNo">10. </span>
									<span class="graph">Количество товара</span>
								</td>
								<td align="center" class="graph bordered" valign="top">
									<span class="graphNo">11. </span>
									<span class="graph">Номер и дата счета фактуры</span>
								</td>
							</tr>
							<xsl:for-each select="sst3:Goods">
								<tr>
									<td align="center" class="graph bordered">
										<xsl:apply-templates select="sst3:GoodsNumeric"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td colspan="2" class="graph bordered">
										<xsl:apply-templates mode="Packaging" select="sst3:GoodsPackaging"/>
									</td>
									<td colspan="2" class="graph bordered">
										<xsl:for-each select="sst3:GoodsDescription">
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td colspan="2" align="center" class="graph  bordered">
										<xsl:apply-templates select="sst3:OriginCriterionCode"/>
										<xsl:if test="sst3:PercentPart">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="sst3:PercentPart"/>
											<xsl:text> %</xsl:text>
										</xsl:if>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="graph bordered">
										<xsl:apply-templates mode="SupplementaryQuantity" select="sst3:GoodsQuantity"/>
									</td>
									<td align="center" class="graph bordered">
										<xsl:for-each select="sst3:GoodsInvoice">
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<xsl:text>,</xsl:text>
											</xsl:if>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="4" class="border_vertical graph" valign="top">
									<span class="graphNo">12. </span>
									<span class="graph">Удостоверение</span>
									<br/>
									<br/>
									<xsl:text>Настоящим удостоверяется, на основании выполненной проверки, что декларация заявителя соответствует действительности</xsl:text>
									<br/>
									<br/>
									<br/>
									<xsl:apply-templates select="sst3:SertifInf/sst3:OrganizationName"/>
									<br/>
									<xsl:apply-templates select="sst3:SertifInf/sst3:Place" mode="ru_address"/>
								</td>
								<td colspan="5" class="border_vertical graph" valign="top">
									<span class="graphNo">13. </span>
									<span class="graph">Декларация заявителя</span>
									<br/>
									<br/>
									<xsl:text>Нижеподписавшийся заявляет, что вышеприведенные сведения соответствуют действительности, что все товары полностью произведены в</xsl:text>
									<table>
										<tbody>
											<tr>
												<td colspan="2">
													<br/>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="value underlined" colspan="2">
													<xsl:apply-templates select="sst3:AppDeclaration/sst3:AppCountry"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="graphLittle" colspan="2">
													<xsl:text>(наименование страны)</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3">
													<br/>
													<br/>
													<xsl:text>И что они соответствуют правилам происхождения, предусмотренным в Главе 6 (Правила происхождения) EAEU-IRAN FTA </xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="border_vertical graph" colspan="4">
									<br/>
									<br/>
									<xsl:apply-templates select="sst3:SertifInf/sst3:FIO"/>
									<br/>
									<br/>
								</td>
								<td class="border_vertical graph" colspan="5">
									<br/>
									<br/>
									<xsl:apply-templates select="sst3:AppDeclaration/sst3:FIO"/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr valign="bottom">
								<td style="border-left: 1px solid black;" class="value underlined">
									<xsl:apply-templates select="sst3:SertifInf/sst3:SignPlace"/>
								</td>
								<td align="center" class="value underlined">
									<xsl:apply-templates select="sst3:SertifInf/sst3:DateInf" mode="russian_date"/>
								</td>
								<td class="value underlined" style="border-right:solid 1px black;" colspan="2"/>
								<td class="value underlined" colspan="2">
									<xsl:apply-templates select="sst3:AppDeclaration/sst3:SignPlace"/>
								</td>
								<td align="center" class="value underlined">
									<xsl:apply-templates select="sst3:AppDeclaration/sst3:DateInf" mode="russian_date"/>
								</td>
								<td colspan="2" style="border-right: 1px solid black;" class="value underlined"/>
							</tr>
							<tr>
								<td style="border-left: 1px solid black;" class="graph underlined">
									<xsl:text>Место</xsl:text>
									<br/>
									<br/>
								</td>
								<td align="center" class="graph underlined">
									<xsl:text>Дата</xsl:text>
									<br/>
									<br/>
								</td>
								<td class="graph underlined">
									<xsl:text>Подпись</xsl:text>
									<br/>
									<br/>
								</td>
								<td style="border-right:solid 1px black;" align="center" class="graph underlined">
									<xsl:text>Печать</xsl:text>
									<br/>
									<br/>
								</td>
								<td colspan="2" class="graph underlined">
									<xsl:text>Место</xsl:text>
									<br/>
									<br/>
								</td>
								<td align="center" class="graph underlined">
									<xsl:text>Дата</xsl:text>
									<br/>
									<br/>
								</td>
								<td class="graph underlined">
									<xsl:text>Подпись</xsl:text>
									<br/>
									<br/>
								</td>
								<td align="center" style="border-right: 1px solid black;" class="graph underlined">
									<xsl:text>Печать</xsl:text>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
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
	<xsl:template match="sst3:Exporter | sst3:Recipient | sst3:Importer">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<br/>
		<xsl:if test="catSert_ru:OKPOID">Код организации по ОКПО:
			<xsl:apply-templates select="catSert_ru:OKPOID"/>
			<br/>
		</xsl:if>
		<xsl:if test="catSert_ru:LegalAddress">Юридический адрес:<br/>
		</xsl:if>
		<xsl:for-each select="catSert_ru:LegalAddress">
			<xsl:apply-templates mode="ru_address" select="."/>
			<br/>
		</xsl:for-each>
		<xsl:if test="catSert_ru:FactAddress">Фактический адрес:<br/>
		</xsl:if>
		<xsl:for-each select="catSert_ru:FactAddress">
			<xsl:apply-templates mode="ru_address" select="."/>
			<br/>
		</xsl:for-each>
		<xsl:if test="catSert_ru:Phone">Тел.: 
		<xsl:for-each select="catSert_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="catSert_ru:Fax">Факс: 
		<xsl:for-each select="catSert_ru:Fax">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="catSert_ru:Email">Email: 
		<xsl:for-each select="catSert_ru:Email">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="TransportMeans" match="*">
		<xsl:if test="sst3:TransportModeCode|sst3:TransportName|sst3:TransportNumber|sst3:TransportMeansNationalityCode">
			<xsl:text/>
			<xsl:apply-templates select="sst3:TransportName"/>
			<xsl:if test="sst3:TransportModeCode">
				<xsl:if test="sst3:TransportName">
					<xsl:text> (</xsl:text>
				</xsl:if>
				<xsl:apply-templates select="sst3:TransportModeCode"/>
				<xsl:if test="sst3:TransportName">
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="sst3:TransportNumber"/>
			<xsl:if test="sst3:TransportModeCode">
				<xsl:if test="sst3:TransportMeansNationalityCode">
					<xsl:text> (</xsl:text>
				</xsl:if>
				<xsl:apply-templates select="sst3:TransportNumber"/>
				<xsl:if test="sst3:TransportMeansNationalityCode">
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:if>
			<xsl:if test="sst3:DepartureDate">
				<xsl:if test="sst3:TransportModeCode|sst3:TransportName|sst3:TransportNumber|sst3:TransportMeansNationalityCode">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>дата отправки (отгрузки): </xsl:text>
				<xsl:apply-templates select="sst3:DepartureDate" mode="russian_date"/>
			</xsl:if>
			<xsl:if test="sst3:UnloadPlace">
				<xsl:if test="sst3:TransportModeCode|sst3:TransportName|sst3:TransportNumber|sst3:TransportMeansNationalityCode|sst3:DepartureDate">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text> место разгрузки: </xsl:text>
				<xsl:apply-templates select="sst3:UnloadPlace"/>
			</xsl:if>
			<xsl:if test="sst3:Note">
				<xsl:text> (</xsl:text>
				<xsl:apply-templates select="sst3:Note"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<br/>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<br/>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<br/>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<br/>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:apply-templates select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:apply-templates select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:apply-templates select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<br/>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<br/>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<br/>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<br/>
			<span class="italic">ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<br/>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="Packaging">
		<br/>
		<xsl:if test="catESAD_cu:PakageTypeCode=1">
			<xsl:if test="catESAD_cu:PakageQuantity!=''">
				<xsl:apply-templates select="catESAD_cu:PakageQuantity"/>
				<xsl:if test="catESAD_cu:PakagePartQuantity">
                                        (<xsl:apply-templates select="catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                                    
                        </xsl:if>
                                    ,
                      </xsl:if>
			<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
				<br/>
						Упаковка:
						<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
					<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
					<xsl:if test="catESAD_cu:PalleteQuantity">
						<span class="graph">-</span>
						<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
					</xsl:if>
					<span class="graph">,</span>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='1']">
				<br/>
						Тара:
						<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='1']">
					<xsl:if test="catESAD_cu:CargoDescriptionText">
						<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
					</xsl:if>
					<span class="graph">,</span>
					<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
							<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
				<br/>
						Груз:
						<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
					<xsl:if test="catESAD_cu:CargoDescriptionText">
						<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
					</xsl:if>
					<span class="graph">,</span>
					<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
							<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
				<br/>
						Поддоны:
						<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
					<xsl:if test="catESAD_cu:CargoDescriptionText">
						<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
					</xsl:if>
					<span class="graph">,</span>
					<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
							<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
				<br/> Индивидуальная упаковка: 
						<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
					<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
					<xsl:if test="catESAD_cu:PalleteQuantity">
						<span class="graph">-</span>
						<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
					</xsl:if>
					<span class="graph">,</span>
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
		<xsl:if test="catESAD_cu:PakageTypeCode=2">
                                без упаковки/
								<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
				<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				<span class="graph">,</span>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="catSert_ru:LegalAddress| catSert_ru:FactAddress">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text> Вид адреса - </xsl:text>
			<xsl:apply-templates select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:apply-templates select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:apply-templates select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:apply-templates select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<!-- xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:AOID or RUScat_ru:TerritoryCode"-->
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:apply-templates select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:apply-templates select="RUScat_ru:OKATO"/>
			</xsl:if>
			<!--xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:apply-templates select="RUScat_ru:KLADR"/></xsl:if>
			<xsl:if test="RUScat_ru:AOGUID"> Глобальный ИД по ФИАС: <xsl:apply-templates select="RUScat_ru:AOGUID"/></xsl:if>
			<xsl:if test="RUScat_ru:AOID"> Уникальный ИД по ФИАС: <xsl:apply-templates select="RUScat_ru:AOID"/></xsl:if-->
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
