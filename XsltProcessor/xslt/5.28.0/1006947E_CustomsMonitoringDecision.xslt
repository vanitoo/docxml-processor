<?xml version="1.0" encoding="utf-8" ?>
<!-- Приказ ФТС России от 23 марта 2023 г. № 224 "Об утверждении форм документов, используемых при проведении мониторинга таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таких сведений, из систем учета товаров" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cmd="urn:customs.ru:Information:CustomsAuditDocuments:CustomsMonitoringDecision:5.25.0">
<!-- Шаблон для типа CustomsMonitoringDecisionType -->
	<xsl:template match="cmd:CustomsMonitoringDecision">
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
					font-style: italic;
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
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="10%"></td>
								<td width="80%" class="value">
									<xsl:if test="cmd:Customs/cat_ru:OfficeName"><xsl:apply-templates select="cmd:Customs/cat_ru:OfficeName"/> (</xsl:if>
									<xsl:apply-templates select="cmd:Customs/cat_ru:Code"/>
									<xsl:if test="cmd:Customs/cat_ru:OfficeName">)</xsl:if>
								</td>
								<td width="10%"></td>
							</tr>
							<tr class="graphLittle">
								<td width="10%"></td>
								<td width="80%" align="center">(наименование таможенного органа)</td>
								<td width="10%"></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr align="center" class="graphHeader">
								<td class="graphMain">РЕШЕНИЕ</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr align="center" class="graphHeader">
								<td>о проведении мониторинга таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в эксперименте по мониторингу таможенными органами таких сведений, из систем учета товаров</td>
							</tr>
							<tr class="delim_3"><td> </td></tr>
							<tr align="center">
								<td>
									<xsl:value-of select="cmd:DocNumber/cmd:CustomsCode"/>/<xsl:value-of select="cmd:DocNumber/cmd:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmd:DocNumber/cmd:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmd:DocNumber/cmd:GTDNumber"/>/<xsl:value-of select="cmd:DocNumber/cmd:Part_5"/>
								</td>
							</tr>
							<tr class="delim_3"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>На основании пункта 9 Положения о проведении эксперимента по мониторингу таможенными органами сведений, имеющихся в их распоряжении и полученных от лиц, участвующих в данном эксперименте, из систем учета товаров, утвержденного постановлением Правительства Российской Федерации от 16 февраля 2023 г. № 240 (далее - Положение),</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:CustomsDecisionPerson">
										<!--xsl:if test="cat_ru:PersonPost">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if-->
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>.</xsl:text>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
											<xsl:text>.</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(фамилия, имя и отчество (при наличии) начальника (заместителя начальника) таможенного органа или уполномоченного им лица)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>РЕШИЛ:</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr style="text-align:justify">
								<td>1. В срок до <u>  <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:DeadlineDate"/></xsl:call-template>  </u> провести мониторинг сведений, имеющихся в их распоряжении таможенного органа и полученных от лица, участвующего в данном эксперименте по мониторингу таких сведений, из систем учета товаров (далее соответственно - таможенный мониторинг, эксперимент, участник эксперимента), в отношении:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:FEAPerson">
										<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
										<xsl:text>, ИНН - </xsl:text>
										<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
										<xsl:text>, КПП - </xsl:text>
										<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
										<xsl:text>, ОГРН - </xsl:text>
										<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
										<xsl:text>, место нахождения: </xsl:text>
										<xsl:if test="cmd:Place">
											<xsl:apply-templates select="cmd:Place"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cmd:Address"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(полное наименование, ОГРН, ИНН/КПП участника эксперимента, место нахождения участника эксперимента и адрес в пределах его места нахождения)</td>
							</tr>
							<tr class="delim"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>2. Выявлены показатели таможенного декларирования товаров (осуществления внешнеэкономической деятельности), послужившие основанием для принятия решения:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:Marks">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:apply-templates select="cmd:Number"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cmd:Description"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(показатели (показатель) таможенного декларирования товаров (осуществления внешнеэкономической деятельности) участника эксперимента, предусмотренные приложением №1 к Положению)</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td style="text-align:justify">анализируемый период:</td>
							</tr>
							<tr>
								<td class="value" align="center">с <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:Term/cmd:BeginDate"/></xsl:call-template> по <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:Term/cmd:EndDate"/></xsl:call-template></td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(даты начала и окончания периода, за который участник эксперимента предоставляет таможенному органу сведения о товарах, ввезенных в Российскую Федерацию в соответствии с таможенной процедурой выпуска для внутреннего потребления, из своей системы учета товаров в соответствии с перечнем сведений, представляемых таможенному органу участником эксперимента, приведенным в приложении №2 к Положению*)</td>
							</tr>
							<tr class="delim"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>3. Поручить проведение таможенного мониторинга должностным лицам таможенного органа:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:CustomsMonitoringPerson">
										<xsl:if test="position()!=1">
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(должность, фамилия, имя, отчество (при наличии))</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:for-each select="cmd:CustomsDecisionPerson">
						<table>
							<tbody class="graphMain">
								<tr align="center">
									<td width="35%" class="value">
										<xsl:apply-templates select="cat_ru:PersonPost"/>
									</td>
									<td width="5%"> </td>
									<td width="20%" class="value"> </td>
									<td width="5%"> </td>
									<td width="35%" class="value">
										<xsl:apply-templates select="." mode="signature"/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td width="35%">(должность должностного лица таможенного органа, принявшего решение)</td>
									<td width="5%"> </td>
									<td width="20%">(подпись)</td>
									<td width="5%"> </td>
									<td width="35%">(фамилия, имя и отчество (при наличии))</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<hr/>
							<tr class="graphLittle">
								<td>* Пункт 15 Положения</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cmd:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="cmd:Address">
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

	<xsl:template mode="signature" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
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
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)" />
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#34;
				&#160;&#160;<u>&#160;
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
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>