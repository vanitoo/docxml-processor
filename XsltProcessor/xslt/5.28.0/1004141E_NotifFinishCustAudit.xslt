<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.24.0" xmlns:nfca="urn:customs.ru:Information:ExchangeDocuments:NotifFinishCustAudit:5.24.0">
	<!-- Приказ ФТС России от 21.06.2019 г. № 1002 "Об утверждении формы и порядка направления уведомления о завершении проверки таможенных, иных документов и (или) сведений" -->
	<!-- Шаблон для типа NotifFinishCustAuditType -->
	<xsl:template match="nfca:NotifFinishCustAudit">
		<html>
			<head>
				<style>
			body {
			background: #cccccc;
			}

			div
			{
			white-space: nowrap;
			}

			div.page {
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			font-style: Italic;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr align="center" class="graphHeader">
								<td>
									<xsl:text>УВЕДОМЛЕНИЕ</xsl:text>
									<br/>
									<br/>
									<xsl:text>о завершении проверки таможенных, иных документов и (или) сведений</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody align="center" class="graphMain">
											<tr>
												<td width="35%" align="center">
													<xsl:call-template name="text_date">
														<xsl:with-param name="date" select="nfca:EndAuditDate"/>
													</xsl:call-template>
												</td>
												<td width="25%"> </td>
												<td width="40%" class="value">
													<xsl:value-of select="nfca:Place"/>
												</td>
											</tr>
											<tr class="graphLittle">
												<td align="center">
													<xsl:text>(дата)</xsl:text>
												</td>
												<td> </td>
												<td>(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify; text-indent: 5%">
									<xsl:text>В соответствии с частью 8 статьи 226 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" уведомляю о том, что проводимая</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:value-of select="nfca:OfficeName"/>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(наименование таможенного органа)</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify">на основании статей 326, 340 Таможенного кодекса Евразийского экономического союза<sup>
										<span class="graphLittle">1</span>
									</sup> и статей 225, 239 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" проверка таможенных, иных документов и (или) сведений в целях</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="nfca:ObjectiveAudit">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(указывается цель проверки в соответствии с пунктом 2 статьи 324 Таможенного кодекса Евразийского экономического союза либо иная конкретная цель)</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>в отношении:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="nfca:CustomsCostInf">
										<br/>
										<xsl:value-of select="nfca:Position"/>
										<xsl:text>) </xsl:text>
										<xsl:for-each select="nfca:CustCostInf">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="nfca:Comment">
											<xsl:text> (</xsl:text>
											<xsl:for-each select="nfca:Comment">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text> </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:for-each select="nfca:ReqDocuments">
											<xsl:text>&#032;</xsl:text>
											<xsl:value-of select="nfca:PrDocumentName"/>
											<xsl:if test="nfca:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:value-of select="nfca:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="nfca:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param select="nfca:PrDocumentDate" name="dateIn"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="nfca:DocCode">
												<xsl:text> (код вида документа: </xsl:text>
												<xsl:value-of select="nfca:DocCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="position()!=last()">
											<xsl:text>; </xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr class="graphLittle">
								<td align="center">(перечень проверенных таможенных, иных документов и (или) сведений с указанием их реквизитов)</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>представленных лицом:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates mode="organization" select="nfca:DeclName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphLittle" align="center">
									<xsl:text>(сведения о лице, чьи документы и (или) сведения проверялись: наименование, основной государственный регистрационный номер </xsl:text>
									<xsl:text>(при наличии), идентификационный номер налогоплательщика (при наличии), код причины постановки на учет (при наличии), место нахождения, </xsl:text>
									<xsl:text>адрес юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя, основной государственный </xsl:text>
									<xsl:text>регистрационный номер индивидуального предпринимателя (при наличии), идентификационный номер налогоплательщика (при наличии), </xsl:text>
									<xsl:text>место жительства индивидуального предпринимателя/фамилия, имя, отчество (при наличии), идентификационный номер налогоплательщика </xsl:text>
									<xsl:text>(при наличии), место жительства физического лица, не являющегося индивидуальным предпринимателем)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>завершена </xsl:text>
									<xsl:call-template name="text_date">
										<xsl:with-param name="date" select="nfca:EndAuditDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:justify; text-indent: 5%">
									<xsl:text>По результатам проведения проверки таможенных, иных документов и (или) сведений нарушения регулирующих таможенные правоотношения международных договоров и актов, составляющих право Евразийского экономического союза, и законодательства Российской Федерации о таможенном регулировании не выявлены.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr class="graphMain">
												<td align="left" width="47%" valign="bottom">
								Начальник (заместитель начальника)<br/>таможенного органа 
							</td>
												<td width="5%"> </td>
												<td valign="bottom" width="15%" class="value"> </td>
												<td width="5%"> </td>
												<td align="center" valign="bottom" width="31%" class="value">
													<xsl:value-of select="nfca:CustomsPerson/cat_ru:PersonName"/>
													<br/>
												</td>
											</tr>
											<tr class="graphLittle" align="center">
												<td valign="top"/>
												<td> </td>
												<td valign="top">(подпись)</td>
												<td> </td>
												<td valign="top">(инициалы , фамилия)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>Настоящее уведомление получил:<sup>
										<span class="graphLittle">2</span>
									</sup>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr class="graphMain" align="center">
											<td width="63%" valign="bottom" class="border_bottom">
												<xsl:value-of select="nfca:SecondExempReceived/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="nfca:SecondExempReceived/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="nfca:SecondExempReceived/cat_ru:PersonMiddleName"/>
											</td>
											<td width="2%"> </td>
											<td width="35%">
												<xsl:call-template name="text_date">
													<xsl:with-param name="date" select="nfca:SecondExempReceived/cat_ru:IssueDate"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr class="graphLittle" align="center">
											<td valign="top" width="63%">(фамилия, инициалы, подпись лица, получившего уведомление)</td>
											<td width="2%"> </td>
											<td class="grahpLittle" width="35%"> (дата получения уведомления)</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
									<sup>1</sup>
									<xsl:text>Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843).</xsl:text>
									<br/>
									<sup>2</sup>
									<xsl:text>Заполняется при вручении уведомления о завершении проверки таможенных, иных документов и (или) сведений лицу, чьи документы и (или) сведения проверялись (его представителю).</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
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
	<xsl:template mode="organization" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text>; документ, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">,&#032;<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">,&#032;<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" name="PersonName" mode="PersonName">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;<xsl:value-of select="cat_ru:PersonName"/>&#160;<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="nfca:PersonCustomsID">,&#160;номер служебного удостоверения:&#160;<xsl:value-of select="nfca:PersonCustomsID"/>
		</xsl:if>
		<xsl:if test="nfca:LNP">,&#160;ЛНП:&#160;<xsl:value-of select="nfca:LNP"/>
		</xsl:if>
		<xsl:if test="nfca:Phone">,&#160;Тел:&#160;<xsl:value-of select="nfca:Phone"/>
		</xsl:if>
		<xsl:if test="nfca:Note">,&#160;<xsl:value-of select="nfca:Note"/>
		</xsl:if>
		<xsl:if test="nfca:Comment">,&#160;<xsl:value-of select="nfca:Comment"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
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
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">,&#032;УИТН:&#032;<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#032;(<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<span class="normal">, </span>
					</xsl:if>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
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
	<xsl:template match="adt_cat:DTNumber">
		<span class="normal">
			<xsl:value-of select="cat_ru:CustomsCode"/>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</span>
		<span class="normal">/</span>
		<span class="normal">
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</span>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($date,1,2)"/>
					</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
</xsl:stylesheet>
