<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:aodr="urn:customs.ru:Information:CustomsAuditDocuments:AdministrativeOffenseDataRequest:5.24.0">
	<!-- Шаблон для типа AdministrativeOffenseDataRequestType -->
	<xsl:template match="aodr:AdministrativeOffenseDataRequest">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 180mm;
					max-width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
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
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
	
					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w180">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</font>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="aodr:OffenceCaseInfo/aodr:CaseCustomsFullName"/>
									<xsl:text> (</xsl:text>
									<xsl:value-of select="aodr:OffenceCaseInfo/aodr:CaseCustomsCode"/>
									<xsl:text>)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>ОПРЕДЕЛЕНИЕ</b>
									<br/><b>об истребовании сведений, необходимых для разрешения дела</b>
									<br/><b>об административном правонарушении</b>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="aodr:DocumentDate"/>
													</xsl:call-template>
												</td>
												<td width="30%"/>
												<td width="35%" class="value">
													<xsl:value-of select="aodr:DoumentPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr">(дата составления)</td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aodr:CustomsPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(должность, таможенный орган, фамилия и инициалы лица, вынесшего определение)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>при производстве по делу об административном правонарушении № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aodr:OffenceCaseInfo/aodr:CaseRegNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(номер дела об АП)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>в отношении</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aodr:Offender"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(субъект правонарушения)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>по</xsl:text>
									<xsl:for-each select="aodr:OffenceCaseInfo/aodr:KoAPArticle">
										<xsl:if test="position()!=1">,</xsl:if>
										<xsl:text> ч. </xsl:text>
										<u>
											&#160;&#160;
											<xsl:for-each select="aodr:NpaArticleParts">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:value-of select="aodr:NpaArticlePart"/>
											</xsl:for-each>
											&#160;&#160;
										</u>
										&#160;<xsl:text>ст. </xsl:text>
										<u>
											&#160;&#160;
											<xsl:value-of select="aodr:NpaArticle"/>
											&#160;&#160;
										</u>
									</xsl:for-each>
									&#160;<xsl:text>КоАП РФ, </xsl:text>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<b>УСТАНОВИЛ:</b>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: left;">
								<td>
									<xsl:text>Для разрешения дела необходимы сведения: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="aodr:RequiredInformation">
												<xsl:sort data-type="number" order="ascending" select="aodr:NumRD"/>
												<xsl:if test="position()!='1'">; </xsl:if>
												<xsl:value-of select="aodr:NumRD"/>
												<xsl:text>. </xsl:text>
												<xsl:apply-templates select="aodr:DescriptionRD"/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="comma"/>
										<xsl:with-param name="descr">
											<xsl:text>(необходимые документы и (или) сведения)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>которыми располагает </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="aodr:OwnerInformation"/>
											<xsl:text>; </xsl:text>
											<xsl:apply-templates select="aodr:OwnerInformation/aodr:Address"/>
											<xsl:if test="aodr:OwnerInformation/aodr:AddressFakt">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="aodr:OwnerInformation/aodr:AddressFakt"/>
											</xsl:if>
											<xsl:if test="aodr:OwnerInformation/aodr:Document">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="aodr:OwnerInformation/aodr:Document"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="dot"/>
										<xsl:with-param name="descr">
											<xsl:text>(владелец документов и (или) сведений)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>На основании изложенного, руководствуясь ст. 26.10 КоАП РФ,</xsl:text>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<b>ОПРЕДЕЛИЛ:</b>
									<br/><br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Истребовать у </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="aodr:OwnerInformation/aodr:Type='1'">
													<xsl:value-of select="aodr:OwnerInformation/aodr:OrganizationName"/>
												</xsl:when>
												<xsl:when test="aodr:OwnerInformation/aodr:Type='2'">
													<xsl:apply-templates select="aodr:OwnerInformation/aodr:Person"/>
												</xsl:when>
												<xsl:when test="aodr:OwnerInformation/aodr:Type='3'">
													<xsl:apply-templates select="aodr:OwnerInformation/aodr:Person"/>
												</xsl:when>
												<xsl:when test="aodr:OwnerInformation/aodr:Type='4'">
													<xsl:apply-templates select="aodr:OwnerInformation/aodr:Person"/>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="descr">
											<xsl:text>(владелец документов и (или) сведений)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'98mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>сведения: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="aodr:RequiredInformation">
												<xsl:sort data-type="number" order="ascending" select="aodr:NumRD"/>
												<xsl:if test="position()!='1'">; </xsl:if>
												<xsl:value-of select="aodr:NumRD"/>
												<xsl:text>. </xsl:text>
												<xsl:apply-templates select="aodr:DescriptionRD"/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="descr">
											<xsl:text>(истребуемые документы и (или) сведения)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>необходимые для разрешения дела об административном правонарушении, в том числе сведения (информация), необходимые для расчета размера административного штрафа.</xsl:text>
									<br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="36%">
													<xsl:text>Должностное лицо таможенного органа</xsl:text>
												</td>
												<td width="5%"/>
												<td class="value" width="20%"/>
												<td width="5%"/>
												<td class="value" align="center" width="34%">
													<xsl:value-of select="aodr:CustomsPerson/cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="substring(aodr:CustomsPerson/cat_ru:PersonName,1,1)"/>
													<xsl:text>.</xsl:text>
													<xsl:if test="aodr:CustomsPerson/cat_ru:PersonMiddleName">
														<xsl:value-of select="substring(aodr:CustomsPerson/cat_ru:PersonMiddleName,1,1)"/>
														<xsl:text>.</xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="descr" valign="top"/>
												<td/>
												<td class="descr" valign="top"><xsl:text>(штамп ЭЦП)</xsl:text></td>
												<td/>
												<td class="descr" valign="top"><xsl:text>(ФИО ДЛ ТО)</xsl:text></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<br/><br/>
									<xsl:text>В соответствии со ст. 26.10 КоАП РФ истребуемые сведения должны быть направлены в трехдневный срок со дня получения определения, а при совершении административного правонарушения, влекущего административный арест либо административное выдворение, незамедлительно. При невозможности представления указанных сведений организация обязана в трехдневный срок уведомить об этом в письменной форме должностное лицо таможенного органа, вынесшее определение. Умышленное невыполнение законных требований должностного лица, ведущего производство по делу об административном правонарушении, влечет за собой административную ответственность на основании ст. 17.7 КоАП РФ.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="aodr:OwnerInformation/aodr:Address | aodr:OwnerInformation/aodr:AddressFakt">
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
	<xsl:template match="aodr:OwnerInformation/aodr:Document">
		<xsl:value-of select="aodr:TypeDocCode"/>
		<xsl:text>:  серия - </xsl:text>
		<xsl:value-of select="aodr:SerDoc"/>
		<xsl:text>, номер - </xsl:text>
		<xsl:value-of select="aodr:NumDoc"/>
		<xsl:if test="aodr:DateDoc">
			<xsl:text>, дата выдачи - </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="aodr:DateDoc"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="aodr:CodeDep">
			<xsl:text>, код подразделения - </xsl:text>
			<xsl:value-of select="aodr:CodeDep"/>
		</xsl:if>
		<xsl:if test="aodr:IssuedDoc">
			<xsl:text>, кем выдан - </xsl:text>
			<xsl:value-of select="aodr:IssuedDoc"/>
		</xsl:if>
		<xsl:text>, страна выдачи - </xsl:text>
		<xsl:value-of select="aodr:CountryCode"/>
		<xsl:text>, актуально на </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="aodr:ActualDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="aodr:CustomsPerson">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="aodr:CustomsFullName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="aodr:CustomsCode"/>
		<xsl:text>), </xsl:text>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aodr:Person">
		<xsl:value-of select="aodr:Surname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="aodr:Name"/>
		<xsl:if test="aodr:MiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="aodr:MiddleName"/>
		</xsl:if>
		<xsl:text>, пол - </xsl:text>
		<xsl:value-of select="aodr:Gender"/>
		<xsl:text>, дата рождения - </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="aodr:BirthDate"/>
		</xsl:call-template>
		<xsl:text>, место рождения - </xsl:text>
		<xsl:value-of select="aodr:BirthPlace"/>
	</xsl:template>
	<xsl:template match="aodr:OwnerInformation/aodr:Person">
		<xsl:value-of select="aodr:Surname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="aodr:Name"/>
		<xsl:if test="aodr:MiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="aodr:MiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aodr:Offender | aodr:OwnerInformation">
		<xsl:choose>
			<xsl:when test="aodr:Type='1'">
				<xsl:text>юридическое лицо: </xsl:text>
				<xsl:value-of select="aodr:OrganizationName"/>
			</xsl:when>
			<xsl:when test="aodr:Type='2'">
				<xsl:text>физическое лицо: </xsl:text>
				<xsl:apply-templates select="aodr:Person"/>
			</xsl:when>
			<xsl:when test="aodr:Type='3'">
				<xsl:text>индивидуальный предприниматель: </xsl:text>
				<xsl:apply-templates select="aodr:Person"/>
			</xsl:when>
			<xsl:when test="aodr:Type='4'">
				<xsl:text>должностное лицо: </xsl:text>
				<xsl:apply-templates select="aodr:Person"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="aodr:INN">
			<xsl:text>, ИНН - </xsl:text>
			<xsl:value-of select="aodr:INN"/>
		</xsl:if>
		<xsl:if test="aodr:KPP">
			<xsl:text>, КПП - </xsl:text>
			<xsl:value-of select="aodr:KPP"/>
		</xsl:if>
		<xsl:if test="aodr:OGRN">
			<xsl:text>, ОГРН - </xsl:text>
			<xsl:value-of select="aodr:OGRN"/>
		</xsl:if>
		<xsl:if test="aodr:RN">
			<xsl:text>, регистрационный номер - </xsl:text>
			<xsl:value-of select="aodr:RN"/>
		</xsl:if>
		<xsl:if test="aodr:NN">
			<xsl:text>, налоговый номер - </xsl:text>
			<xsl:value-of select="aodr:NN"/>
		</xsl:if>
		<xsl:if test="aodr:RegDate">
			<xsl:text>, дата регистрации - </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="aodr:RegDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="aodr:RegPlace">
			<xsl:text>, место регистрации - </xsl:text>
			<xsl:value-of select="aodr:RegPlace"/>
		</xsl:if>
		<xsl:if test="aodr:CountryCode">
			<xsl:text>, код страны принадлежности - </xsl:text>
			<xsl:value-of select="aodr:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value" align="center" style="text-align: center;">
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
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