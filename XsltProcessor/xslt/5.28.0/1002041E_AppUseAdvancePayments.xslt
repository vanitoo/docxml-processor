<?xml version="1.0" encoding="UTF-8"?>
<!--с версии 5.15.0 "Проект приказа ФТС России "О внесении изменений в приказ ФТС России от 16 января 2019 г. № 33"-->
<!--до версии 5.14.5 (включительно) Приказ ФТС России от 16.01.2019 № 33 "Об утверждении формы заявления об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных 
в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней и порядка представления его лицом, внесшим авансовые платежи"-->
<xsl:stylesheet exclude-result-prefixes="cat_ru auap" version="1.0" xmlns:auap="urn:customs.ru:Information:CommercialFinanceDocuments:AppUseAdvancePayments:5.28.0" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.27.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="auap:AppUseAdvancePayments">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
					body {
					background: #cccccc;
					/*font-family: Arial;*/
					font-size: 11pt;
					}

					div
					{
					white-space: normal;
					}

					div.page {
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
					margin: 0;
					font-size: 11pt;
					font-family: Arial;
					}

					/*table.border tr td
					{
					border: 1px solid gray;
					}*/

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
					/*td.bordered
					{
					border: solid 1px windowtext;
					}*/

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
					}

					td.graphMain
					{
					vertical-align:top;
					font-size: 10pt;
					}

					.graphHeader
					{
					vertical-align:top;
					font-size: 12pt;
					font-family: Arial;
					text-align: center;
					}					

					.graphLittle 
					{						
					font-family: Arial;						
					font-size: 7pt;
					text-align: center;
					vertical-align:top;
					}

					.bordered{
					border-collapse: collapse;
					border: 1px solid black;
					}

					.footnote{
					font-family: Arial;						
					font-size: 7pt;
					text-align: left;
					}

					.delim_3 {
					height: 3pt;
					}

                    </style>
			<body>
				<div class="page">
					<table class="grahpMain" width="100%">
						<tbody>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td width="48%"/>
												<td width="2%">В</td>
												<td align="center" class="value" width="50%">
													<xsl:value-of select="auap:Customs/cat_ru:OfficeName"/>
													<xsl:if test="auap:Customs/cat_ru:OfficeName"> (</xsl:if>
													<xsl:value-of select="auap:Customs/cat_ru:Code"/>
													<xsl:if test="auap:Customs/cat_ru:OfficeName">)</xsl:if>
												</td>
											</tr>
											<tr>
												<td/>
												<td/>
												<td class="graphLittle" align="center">(наименование таможенного органа)</td>
											</tr>
											<tr>
												<td colspan="3" class="delim_3">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr align="center" class="graphHeader">
								<td>
									<b>Заявление лица об использовании авансовых платежей в связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней</b>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:if test="auap:AppNumber/cat_ru:PrDocumentDate"> от <xsl:call-template name="text_date">
											<xsl:with-param name="date" select="auap:AppNumber/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="auap:AppNumber/cat_ru:PrDocumentNumber"> № <span class="value">
											<xsl:value-of select="auap:AppNumber/cat_ru:PrDocumentNumber"/>
										</span>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>от</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="auap:ApplicantInfo"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">(наименование организации или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физичского лица, идентификациоинный номер налогоплательщика (при наличии), место нахождения)</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td style="text-indent: 5%; text-align:justify">В связи с получением уведомления (уточнения к уведомлению) о не уплаченных в установленный срок суммах таможенных платежей, специальных, антидемпинговых, компенсацинных пошлин, процентов и пеней от&#160;
								<xsl:choose>
									<xsl:when test="auap:NotifNumber"><span class="value">&#160;<xsl:call-template name="russian_date">
												<xsl:with-param select="auap:NotifNumber/cat_ru:PrDocumentDate" name="dateIn"/>
											</xsl:call-template>&#160;</span>&#160;№&#160;<span class="value">&#160;<xsl:value-of select="auap:NotifNumber/cat_ru:PrDocumentNumber"/>&#160;</span>
										</xsl:when>
										<xsl:otherwise>________ № __________</xsl:otherwise>
									</xsl:choose>
									<text>на основании статьи 35 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении </text>
									<text>изменений в отдельные законодательные акты Росийской Федерации» прошу авансовые платежи, отраженные на лицевом счете, зачесть в счет исполнения </text>
									<text>обязанности по уплате сумм таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней и скорректировать РТП</text>
									<span class="graphLittle"><sup>1</sup></span>
									<text>, РТП-Ф</text>
									<span class="graphLittle"><sup>2</sup></span>
									<text>, ТПО</text>
									<span class="graphLittle"><sup>3</sup></span>
									<text> таможенный документ</text>
									<span class="graphLittle"><sup>4</sup></span>
									<text> №&#160;</text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="auap:KDTorCPCID/auap:CPCID">
													<xsl:text>РТП </xsl:text>
													<xsl:apply-templates select="auap:KDTorCPCID/auap:CPCID"/>
												</xsl:when>
												<xsl:when test="auap:KDTorCPCID/auap:CPCFID">
													<xsl:text>РТП-Ф </xsl:text>
													<xsl:apply-templates select="auap:KDTorCPCID/auap:CPCFID"/>
												</xsl:when>
												<xsl:when test="auap:KDTorCPCID/auap:KTPOID">
													<xsl:text>ТПО </xsl:text>
													<xsl:apply-templates select="auap:KDTorCPCID/auap:KTPOID"/>
												</xsl:when>
												<xsl:when test="auap:KDTorCPCID/auap:OtherCustDocInfoID/auap:TPOID">
													<xsl:text>ТПО </xsl:text>
													<xsl:apply-templates select="auap:KDTorCPCID/auap:OtherCustDocInfoID/auap:TPOID"/>
												</xsl:when>
												<xsl:when test="auap:KDTorCPCID/auap:OtherCustDocInfoID/auap:OtherCustDoc">
													<xsl:apply-templates select="auap:KDTorCPCID/auap:OtherCustDocInfoID/auap:OtherCustDoc"/>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(заполняется плательщиком таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней)'"/>
										<xsl:with-param name="width" select="'90%'"/>
									</xsl:call-template>
									<text>, оформить корректировку декларации на товары №&#160;</text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="auap:KDTorCPCID/auap:KDTID"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(заполняется лицом, несущим солидарную с плательщиком обязанность по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней)'"/>
										<xsl:with-param name="width" select="'40%'"/>
									</xsl:call-template>
									<br/>
									<text>на сумму уплаты в размере:</text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td width="5%"/>
												<td width="45%"/>
												<td width="50%"/>
											</tr>
											<tr>
												<td class="bordered" align="center" rowspan="2">№</td>
												<td class="bordered" align="center" colspan="2">Сведения об использовании авансовых платежей</td>
											</tr>
											<tr>
												<td class="bordered" align="center">Код вида платежа</td>
												<td class="bordered" align="center">Сумма, рубли</td>
											</tr>
											<xsl:for-each select="auap:AdvancePayment">
												<tr>
													<td class="bordered" align="center">
														<xsl:value-of select="position()"/>
													</td>
													<td class="bordered" align="center">
														<xsl:value-of select="auap:PaymentModeCode"/>
													</td>
													<td class="bordered" align="right" style="padding-right: 10pt">
														<xsl:value-of select="translate(translate(format-number(auap:Amount, '#,###.00'),',',' '),'.',',')"/>
													</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td class="bordered"/>
												<td align="right" class="bordered">Итого:</td>
												<td class="bordered" align="right" style="padding-right: 10pt">
													<xsl:value-of select="translate(translate(format-number(auap:Amount, '#,###.00'),',',' '),'.',',')"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td class="value" width="35%"/>
												<td width="25%"/>
												<td class="value" align="center" width="40%">
													<xsl:apply-templates select="auap:ApplicantSignature"/>
												</td>
											</tr>
											<tr>
												<td class="footnote">(подпись руководителя организации или уполномоченного от имено организации лица (индивидуального предпринимателя) либо физического лица)<br>М.П.</br>
													<sup>5</sup>
												</td>
												<td/>
												<td class="graphLittle">(инициалы, фамилия)</td>
											</tr>
											<xsl:if test="auap:ApplicantSignature/cat_ru:IssueDate">
												<tr>
													<td colspan="2"/>
													<td>
														<xsl:call-template name="text_date">
															<xsl:with-param select="auap:ApplicantSignature/cat_ru:IssueDate" name="date"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table class="grahpMain" width="100%">
										<tbody>
											<tr>
												<td width="20%" class="value"/>
												<td width="20%"/>
											</tr>
											<tr>
												<td class="footnote" align="left" colspan="2">
													<sup>1 </sup> РТП - расчет таможенных пошлин,налогов, специальных, антидемпинговых, компенсационных пошлин.
													<br>
														<sup>2</sup> РТП-Ф - расчет таможенных пошлин, налогов, взимаемых по единым ставкам, либо таможенных пошлин, налогов, взимаемых в виде совокупного таоженного платежа.</br>
													<br>
														<sup>3</sup> ТПО - таможенный приходный ордер.</br>
													<br>
														<sup>4</sup> Таможенный документ - таможенный документ, определенный Евразийской экономической комиссией в соответствии с пунктом 24 статьи 266 Таможенного кодекса Евразийского экономического союза (Федеральный закон от 14 ноября 2017 г. № 317-ФЗ «О ратификации Договора о Таможенном кодексе Евразийского экономического союза» (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843).</br>
													<br>
														<sup>5</sup> Если в соответствии с законодательством Российской Федерации лицо, подавшее заявление на бумажном носителе, имеет печать.</br>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="auap:ApplicantInfo">
		<xsl:if test="els_agr:OrganizationName">
			<xsl:value-of select="els_agr:OrganizationName"/>
		</xsl:if>
		<xsl:if test="els_agr:ShortName">
			<xsl:if test="string-length(els_agr:OrganizationName) &gt; 0">&#160;(</xsl:if>
			<xsl:value-of select="els_agr:ShortName"/>
			<xsl:if test="string-length(els_agr:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(els_agr:INN) &gt; 0 or string-length(els_agr:KPP) &gt; 0">&#160;
		<xsl:if test="string-length(els_agr:INN) &gt; 0">ИНН</xsl:if>
			<xsl:if test="string-length(els_agr:INN) &gt; 0 and string-length(els_agr:KPP) &gt; 0">/</xsl:if>
			<xsl:if test="string-length(els_agr:KPP) &gt; 0">КПП</xsl:if>:&#160;</xsl:if>
		<xsl:if test="els_agr:INN">
			<xsl:value-of select="els_agr:INN"/>
		</xsl:if>
		<xsl:if test="els_agr:KPP">
			<xsl:if test="string-length(els_agr:INN) &gt; 0">&#160;/&#160;</xsl:if>
			<xsl:value-of select="els_agr:KPP"/>
		</xsl:if>
		<xsl:if test="els_agr:OKSM">
			<xsl:if test="els_agr:OrganizationName|els_agr:ShortName">,&#160;</xsl:if>Код страны:&#160;<xsl:value-of select="els_agr:OKSM"/>
		</xsl:if>
		<xsl:if test="els_agr:OKTMO">
			<xsl:if test="els_agr:OrganizationName|els_agr:ShortName">,&#160;</xsl:if>ОКТМО:&#160;<xsl:value-of select="els_agr:OKTMO"/>
		</xsl:if>
		<xsl:if test="els_agr:Address">
			<br/>
			<xsl:for-each select="els_agr:Address">
				<xsl:if test="position()=1">Адрес:&#160;</xsl:if>
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="els_agr:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>)</xsl:otherwise>
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
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>)</xsl:otherwise>
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
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">&#160;<xsl:if test="string-length(cat_ru:INN) &gt; 0">ИНН</xsl:if>
			<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">/</xsl:if>
			<xsl:if test="string-length(cat_ru:KPP) &gt; 0">КПП</xsl:if>:&#160;</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">&#160;/&#160;</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<xsl:if test="cat_ru:INN|cat_ru:KPP">,&#160;</xsl:if>ОГРН:&#160;<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">&#160;БИН::&#160;<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#160;/&#160;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">&#160;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">&#160;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#160;/&#160;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#160;/&#160;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#160;/&#160;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">&#160;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">&#160;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">&#160;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">&#160;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">&#160;</span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
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
	<xsl:template match="auap:ApplicantSignature">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--Шаблон для типа TPORegNumberType-->
	<xsl:template match="auap:KTPOID | auap:TPOID">
		<xsl:value-of select="auap:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn">
				<xsl:value-of select="auap:RegistrationDate"/>
			</xsl:with-param>
		</xsl:call-template> 
		<xsl:text>/</xsl:text>
		<xsl:value-of select="auap:DocNumber"/>
		<xsl:if test="auap:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="auap:Code"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="auap:OtherCustDoc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<!--Шаблон для типа RUDECLcat:CustomDocIDType-->
	<xsl:template match="auap:KDTID | auap:CPCID | auap:CPCFID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn">
				<xsl:value-of select="cat_ru:RegistrationDate"/>
			</xsl:with-param>
		</xsl:call-template> 
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="RUDECLcat:Code">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="RUDECLcat:Code"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="graphLittle">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="DTNumber" match="*">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
</xsl:stylesheet>
