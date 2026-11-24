<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 49н от 29 марта 2019 года
 "Об утверждении Порядка приостановления и возобновления действия свидетельства о включении в реестр уполномоченных экономических операторов, 
исключения юридических лиц из реестра уполномоченных экономических операторов, форм решений о приостановлении, возобновлении действия свидетельства 
о включении в реестр уполномоченных экономических операторов, об исключении юридического лица из данного реестра, а также случаев, в которых решение 
уполномоченного таможенного органа о приостановлении действия свидетельства о включении в реестр уполномоченных экономических операторов и решение 
о возобновлении действия данного свидетельства принимаются в автоматическом режиме (без участия должностных лиц таможенных органов)"
DocKind = 0 - Приложение №2 (Приостановление действия)
DocKind = 1 - Приложение №3 (Возобновление действия)
DocKind = 2 - Приложение №4 (Исключение из реестра)
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:daeorc="urn:customs.ru:Information:RegistrationDocuments:DecisionByAEORegistryCertificate:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа DecisionByAEORegistryCertificateType -->
	<xsl:template match="daeorc:DecisionByAEORegistryCertificate">
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
                  padding: 10mm 10mm 10mm 20mm;
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
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<xsl:choose>
											<xsl:when test="daeorc:DocKind = 0">
												<b>Решение о приостановлении действия свидетельства о включении в реестр уполномоченных экономических операторов</b>
											</xsl:when>
											<xsl:when test="daeorc:DocKind = 1">
												<b>Решение о возобновлении действия свидетельства о включении в реестр уполномоченных экономических операторов</b>
											</xsl:when>
											<xsl:when test="daeorc:DocKind = 2">
												<b>Решение об исключении юридического лица из реестра уполномоченных экономических операторов</b>
											</xsl:when>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td width="30%">
									<xsl:call-template name="text_date"><xsl:with-param name="date" select="daeorc:DecisionDate"/></xsl:call-template>
								</td>
								<td width="40%"></td>
								<td width="30%">
									<xsl:if test="daeorc:DecisionNumber">
										<xsl:text>№ </xsl:text><span class="value">&#160;<xsl:value-of select="daeorc:DecisionNumber"/>&#160;</span>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>На основании</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="daeorc:ReferenceNormFederalLaw"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(ссылка на норму Таможенного кодекса Евразийского экономического союза и (или) Федерального закона от 3 августа 2018 г. № 289-ФЗ &quot;О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации&quot;)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/><br/>
									<xsl:text>в связи с</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="daeorc:Reason"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description">
											<xsl:choose>
												<xsl:when test="daeorc:DocKind = 0">
													(указываются основания для приостановления действия свидетельства уполномоченного экономического оператора)
												</xsl:when>
												<xsl:when test="daeorc:DocKind = 1">
													(указываются основания для возобновления действия свидетельства уполномоченного экономического оператора)
												</xsl:when>
												<xsl:when test="daeorc:DocKind = 2">
													(указываются основания для исключения юридического лица из реестра уполномоченных экономических операторов)
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td align="center"><br/><b>Решил:</b></td>
							</tr>
							<xsl:choose>
								<xsl:when test="daeorc:DocKind = 0">
									<tr>
										<td>
											<xsl:text>приостановить действие свидетельства № </xsl:text>
											<span class="value"><xsl:value-of select="daeorc:AEOCertificateRegNumber/daeorc:SerialNumber"/></span>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="text_date"><xsl:with-param name="date" select="daeorc:AEOCertificateRegNumber/daeorc:AEOCertificateDateBegin"/></xsl:call-template>
											<xsl:text> о включении в реестр уполномоченных экономических операторов</xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="daeorc:AEOOrganization"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование, основной государственный регистрационный номер, идентификационный номер налогоплательщика юридического лица)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="daeorc:DocKind = 1">
									<tr>
										<td>
											<xsl:text>возобновить действие свидетельства № </xsl:text>
											<span class="value"><xsl:value-of select="daeorc:AEOCertificateRegNumber/daeorc:SerialNumber"/></span>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="text_date"><xsl:with-param name="date" select="daeorc:AEOCertificateRegNumber/daeorc:AEOCertificateDateBegin"/></xsl:call-template>
											<xsl:text> о включении в реестр уполномоченных экономических операторов</xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="daeorc:AEOOrganization"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование, основной государственный регистрационный номер, идентификационный номер налогоплательщика юридического лица)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="daeorc:DocKind = 2">
									<tr>
										<td>
											<xsl:text>1) исключить из реестра уполномоченных экономических операторов</xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="daeorc:AEOOrganization"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование, основной государственный регистрационный номер, идентификационный номер налогоплательщика юридического лица)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
											<xsl:text>2) свидетельство № </xsl:text>
											<span class="value"><xsl:value-of select="daeorc:AEOCertificateRegNumber/daeorc:SerialNumber"/></span>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="text_date"><xsl:with-param name="date" select="daeorc:AEOCertificateRegNumber/daeorc:AEOCertificateDateBegin"/></xsl:call-template>
											<xsl:text>о включении в реестр уполномоченных экономических операторов признать недействующим.</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="40%">Начальник (лицо, его замещающее),<br/>заместитель начальника<br/>таможенного органа</td>
								<td width="2.5%"></td>
								<td width="15%" class="value"></td>
								<td width="2.5%"></td>
								<td width="40%" class="value" align="center" valign="bottom">
									<xsl:value-of select="daeorc:SigningDetails/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="daeorc:SigningDetails/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="daeorc:SigningDetails/cat_ru:PersonSurname"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="daeorc:AEOOrganization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexData"/></sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</span>
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
			</xsl:choose>&#160;</span>&#160;<xsl:value-of select="substring($date,1,2)"/>
		<span class="value">
			<xsl:value-of select="substring($date,3,2)"/>
		</span> г.</xsl:template>
		
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
