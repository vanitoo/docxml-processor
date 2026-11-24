<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России № 941 от 18 октября 2023 года "Об утверждении порядка создания зоны таможенного контроля на участке территории опережающего развития или предоставленном резиденту свободного порта Владивосток земельном участке для целей применения таможенной процедуры свободной таможенной зоны и формы заявления о создании такой зоны таможенного контроля"-->
<!--Приказ ФТС России № 915 от 15 октября 2020 года "Об утверждении Порядка принятия решения о создании зоны таможенного контроля на участке резидента Арктической зоны Российской Федерации для целей применения таможенной процедуры свободной таможенной зоны"-->
<!--Приказ ФТС России № 555 от 28 июня 2023 года "Об утверждении порядка принятия таможенным органом решения о создании зоны таможенного контроля на участке территории свободной экономической зоны, созданной на территориях Донецкой Народной Республики, Луганской Народной Республики, Запорожской области и Херсонской области, во внутренних морских водах и в территориальном море Российской Федерации, примыкающих к территориям Донецкой Народной Республики, Запорожской области и Херсонской области"-->
<!--  Приказ Минфина России № 36н от 1 апреля 2024 года «Об утверждении формы обязательства о соблюдении условий использования иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, и порядка подачи в таможенный орган такого обязательства». Приложение №1  -->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:oct="urn:customs.ru:Information:ExchangeDocuments:STZ_ObligComplyTermsCCZ:5.28.0">
	
	<xsl:param name="STZ_NotifReg"/>
	
<!-- Шаблон для типа STZ_ObligComplyTermsCCZType -->
	<xsl:template match="//*[local-name()='oct:STZ_ObligComplyTermsCCZ']//*" priority="-1">
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
	<xsl:template match="oct:STZ_ObligComplyTermsCCZ">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 10mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					vertical-align:bottom;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}


					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;
					text-align: center;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;
					font-size: 10pt;}

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

					.delim_3
					{height: 3pt;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="oct:ResidentKind = 5">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<xsl:text>Обязательство</xsl:text>
											<br/>
											<xsl:text>о соблюдении условий использования иностранных товаров,</xsl:text>
											<br/>
											<xsl:text>помещенных под таможенную процедуру свободной таможенной зоны</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="40%"/>
														<td align="right" valign="bottom" width="5%">В&#160;</td>
														<td align="center" width="55%" class="value">
															<xsl:apply-templates select="oct:Customs" mode="CustomsOffice"/>
														</td>
													</tr>
													<tr>
														<td colspan="2"/>
														<td valign="top" class="graphLittle">
															<xsl:text>(наименование таможенного органа (с указанием кода таможенного органа))</xsl:text><sup>1</sup>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="right" valign="bottom">от&#160;</td>
														<td align="center" class="value">
															<xsl:apply-templates mode="organization" select="oct:Resident"/>
														</td>
													</tr>
													<tr>
														<td colspan="2"/>
														<td class="graphLittle">
															<xsl:text>(резидент особой экономической зоны (далее - ОЭЗ) (для юридического лица - наименование организации, содержащее указание на ее организационно-правовую форму (сокращенное наименование, если такое наименование предусмотрено учредительными документами юридического лица), основной государственный регистрацинный номер, идентификацинный номер налогоплательщика (далее - ИНН), код причины постановки на учет в налоговом органе, адрес в пределах места нахождения юридического лица, реквизиты свидетельства о включении в реестр резидентов особой экономической зоны (делее - реквизиты свитетельства); для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес регистрации физического лица по месту жительства, ИНН, основной государственный регистрационный номер индивидуального предприниателя, сведения о документе, удостоверяющем личность физического лица, и реквизиты свидетельства)</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Регистрационный № </xsl:text>
											<xsl:variable name="num_customs">
												<xsl:if test="$STZ_NotifReg">
													<xsl:apply-templates select="$STZ_NotifReg/*[local-name() = 'RegistrationNumber']/*[local-name() = 'CustomsCode']"/>
												</xsl:if>
											</xsl:variable>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data" select="$num_customs"/>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(код таможенного органа)'"/>
												<xsl:with-param name="width" select="'30mm'"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:variable name="num_date">
												<xsl:if test="$STZ_NotifReg">
													<xsl:apply-templates select="$STZ_NotifReg/*[local-name() = 'RegistrationNumber']/*[local-name() = 'RegistrationDate']" mode="gtd_date"/>
												</xsl:if>
											</xsl:variable>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data" select="$num_date"/>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(день, месяц, год)'"/>
												<xsl:with-param name="width" select="'30mm'"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:variable name="num_number">
												<xsl:if test="$STZ_NotifReg">
													<xsl:apply-templates select="$STZ_NotifReg/*[local-name() = 'RegistrationNumber']/*[local-name() = 'Number']"/>
												</xsl:if>
											</xsl:variable>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data" select="$num_number"/>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(номер обязательства о соблюдении условий использования иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны (далее соответственно - Обязательство СТЗ)'"/>
												<xsl:with-param name="width" select="'60mm'"/>
											</xsl:call-template>
											<xsl:text>/ОСПР</xsl:text>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Обязуюсь соблюдать условия использования иностранных товаров</xsl:text><sup>2</sup>					
											<xsl:text>, ввозимых и помещаемых под таможенную процедуру СТЗ, на земельном участке резитента ОЭЗ, расположенном:</xsl:text>
											<table class="inlinetable" style="100%">
												<tbody>
													<tr align="left">
														<td class="value">
															<xsl:apply-templates select="oct:CreationDoc" mode="doc_base"/>
															<xsl:if test="oct:CreationDoc">; </xsl:if>
															<xsl:apply-templates select="oct:OEZInfo/oct:OEZAddress" mode="ru_address"/>
															<xsl:if test="not(oct:OEZInfo/oct:OEZAddress)">
																<xsl:apply-templates select="oct:Placement"/>
															</xsl:if>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															<xsl:text>(реквизиты постановления Правительства Российской Федерации о создании ОЭЗ</xsl:text>
															<sup>3</sup>
															<xsl:text>, адрес земельного участка резидента ОЭЗ или при отсутствии адреса земельного участка иное описание местоположения земельного участа)</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
											<xsl:text>при перевозке таких товаров </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:for-each select="oct:TransportKind">
														<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
														<xsl:choose>
															<xsl:when test=". = '1'">
																<xsl:text>авто</xsl:text>
															</xsl:when>
															<xsl:when test=". = '2'">
																<xsl:text>ж/д</xsl:text>
															</xsl:when>
															<xsl:when test=". = '3'">
																<xsl:text>авиа</xsl:text>
															</xsl:when>
															<xsl:when test=". = '4'">
																<xsl:text>водным</xsl:text>
															</xsl:when>
															<xsl:when test=". = '5'">
																<xsl:text>иным</xsl:text>
															</xsl:when>
														</xsl:choose>
													</xsl:for-each>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(вид транспорта)'"/>
												<xsl:with-param name="width" select="'50mm'"/>
											</xsl:call-template>
											<xsl:text> от места их нахождения при таможенном декларировании</xsl:text><br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="oct:GoodsLocation" mode="ru_address"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(место нахождения товаров при их таможенном декларировании)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
											<br/>
											<xsl:text> в следующий срок перевозки и размещения товаров на земельном участке резидента ОЭЗ </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="oct:DeliveryTime"/>
													</xsl:call-template>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'в днях'"/>
												<xsl:with-param name="width" select="'15mm'"/>
											</xsl:call-template>
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
													<tr valign="bottom">
														<td align="left" width="60%">
															<xsl:text>Дата подачи настоящего обязательства</xsl:text>
														</td>
														<td align="center" class="value" width="40%">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="oct:ObligationsDate"/>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">(день, месяц, год)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="bottom">
														<td align="left" class="value" width="40%">
															<xsl:apply-templates select="oct:ResidentSignature/cat_ru:PersonPost"/>
															<br/>
															<xsl:apply-templates select="oct:ConfirmDoc" mode="doc_base"/>
														</td>
														<td width="7%"/>
														<td class="value" width="16%"/>
														<td width="7%"/>
														<td align="center" class="value" width="30%">
															<xsl:for-each select="oct:ResidentSignature/*[contains(translate(local-name(), 'name','NAME'), 'NAME')]">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle">
															(лицо, подающее настоящее Обязательство, должность (при наличии), реквизиты документа, подтверждающего полномочия  лица, подающего Обязательство (при наличии)
														</td>
														<td/>
														<td class="graphLittle">(подпись)</td>
														<td/>
														<td class="graphLittle">(фамилия, имя, отчество (при наличии))</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<br/>
							<div class="descr" style="text-align:left;">
								<sup>1</sup><xsl:text> Решение Коллегии Евразийской экономической комиссии от 2 сентября 2019 г. № 145 "О классификаторе таможенных органов государств - членов Евразийского экономического союза", является обязательным для Российской Федерации в соответствии с Договором о Евразийском экономическом союзе от 29 мая 2014 г., ратифицированным Федеральным законом от 3 октября 2014 г. № 279-ФЗ "О ратификации Договора о Евразийском экономическом союзе" (Договор вступил в силу 1 января 2015 г.), вступило в силу 1 июля 2020 г.</xsl:text>
								<br/>
								<sup>2</sup><xsl:text> Часть 5.2 статьи 37 Федерального закона от 22 июля 2005 г. № 116-ФЗ "Об особых экономических зонах в Российской Федерации" (далее - Федеральный закон № 116-ФЗ).</xsl:text>
								<br/>
								<sup>3</sup><xsl:text> Часть 1 статьи 6 Федерального закона № 116-ФЗ.</xsl:text>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain" width="100%">
												<tbody>
													<tr>
														<td width="40%"/>
														<td align="right" valign="bottom" width="5%">В&#160;</td>
														<td align="center" width="55%" class="value">
															<xsl:apply-templates select="oct:Customs" mode="CustomsOffice"/>
														</td>
													</tr>
													<tr>
														<td colspan="2"/>
														<td valign="top" class="graphLittle">
															<xsl:choose>
																<xsl:when test="oct:ResidentKind = '1' or oct:ResidentKind = '2' or oct:ResidentKind = '3'">
																	<xsl:text>(наименование таможенного органа (с указанием кода таможенного органа))</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '4'">
																	<xsl:text>(наименование таможенного органа и код таможенного органа)</xsl:text>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>(наименование таможенного органа (с указанием кода таможенного органа))</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td/>
														<td align="right" valign="bottom">от&#160;</td>
														<td align="center" class="value">
															<xsl:apply-templates mode="organization" select="oct:Resident"/>
														</td>
													</tr>
													<tr>
														<td colspan="2"/>
														<td class="graphLittle">
															<xsl:choose>
																<xsl:when test="oct:ResidentKind = '1'">
																	<xsl:text>(резидент территории опережающего развития (полное наименование организации - для юридического лица, фамилия, имя, отчество (при наличии) - для физического лица, индивидуальный номер налогоплательщика, реквизиты свидетельства, удостоверяющего регистрацию лица в качестве резидента территории опережающего развития (далее - резидент))</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '2'">
																	<xsl:text>(резидент свободного порта Владивосток (полное наименование организации - для юридического лица, фамилия, имя, отчество (при наличии) - для физического лица, индивидуальный номер налогоплательщика, реквизиты свидетельства о включении в реестр резидентов свободного порта Владивосток (далее - резидент))</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '3'">
																	<xsl:text>(резидент Арктической зоны Российской Федерации (полное наименование организации - для юридического лица, фамилия, имя, отчество (при наличии) - для физического лица, индивидуальный номер налогоплательщика, реквизиты свидетельства о включении в реестр резидентов Арктической зоны Российской Федерации (далее - резидент))</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '4'">
																	<xsl:text>(полное наименование юридического лица - для юридического лица, фамилия, имя, отчество (при наличии) - для физического лица, индивидуальный номер налогоплательщика, реквизиты свидетельства о включении в единый реестр участников свободной экономической зоны)</xsl:text>
																</xsl:when>
															</xsl:choose>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<xsl:text>Обязательство</xsl:text>
											<br/>
											<xsl:text>о соблюдении условий использования товаров</xsl:text>
											<xsl:if test="oct:ResidentKind = '4'">
												<xsl:text>, помещенных под таможенную процедуру свободной таможенной зоны</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Обязуюсь разместить иностранные товары, ввозимые в соответствии с контрактом </xsl:text>
											<xsl:choose>
												<xsl:when test="oct:ResidentKind = '1' or oct:ResidentKind = '2' or oct:ResidentKind = '3'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:ContractDetails" mode="doc_base"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(реквизиты контракта (номер и дата))'"/>
														<xsl:with-param name="width" select="'100mm'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '4'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:ContractDetails" mode="doc_base"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(номер и дата)'"/>
														<xsl:with-param name="width" select="'100mm'"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:text> и помещаемые под таможенную процедуру свободной таможенной зоны, на территории участка, расположенного на (в) </xsl:text>
											<xsl:choose>
												<xsl:when test="oct:ResidentKind = '1'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocationName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(наименование территории опережающего развития)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '2'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocationName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(наименование свободного порта Владивосток)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '3'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocationName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(наименование Арктической зоны Российской Федерации)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '4'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocationName"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(территории республики, области или внутренние морские воды, территориальное море)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:text> по адресу </xsl:text>
											<xsl:choose>
												<xsl:when test="oct:ResidentKind = '1' or oct:ResidentKind = '2' or oct:ResidentKind = '3'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocation" mode="ru_address"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(адрес места нахождения участка резидента)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
													<xsl:text> при перевозке таких товаров </xsl:text>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '4'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocation" mode="ru_address"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(адрес в пределах места нахождения участка и (или) координаты водного участка)'"/>
														<xsl:with-param name="width" select="'140mm'"/>
													</xsl:call-template>
													<xsl:text> и перевозимые </xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:choose>
														<xsl:when test="oct:TransportKind = '1'">
															<xsl:text>авто</xsl:text>
														</xsl:when>
														<xsl:when test="oct:TransportKind = '2'">
															<xsl:text>ж/д</xsl:text>
														</xsl:when>
														<xsl:when test="oct:TransportKind = '3'">
															<xsl:text>авиа</xsl:text>
														</xsl:when>
														<xsl:when test="oct:TransportKind = '4'">
															<xsl:text>водный</xsl:text>
														</xsl:when>
														<xsl:when test="oct:TransportKind = '4'">
															<xsl:text>иной</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(вид транспорта (авто, авиа, ж/д, водный))'"/>
												<xsl:with-param name="width" select="'80mm'"/>
											</xsl:call-template>
											<xsl:text> транспортом от места их нахождения при таможенном декларировании и выпуске в соответствии с таможенной процедурой свободной таможенной зоны </xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="oct:ResidentKind = '1' or oct:ResidentKind = '2' or oct:ResidentKind = '3'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocation" mode="ru_address"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(место нахождения товаров при их таможенном декларировании и выпуске)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '4'">
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates select="oct:GoodsLocation" mode="ru_address"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="description" select="'(адрес в пределах места нахождения товаров при их таможенном декларировании)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:text> в следующий срок перевозки и размещения товаров на участке </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="oct:DeliveryTime"/>
													</xsl:call-template>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(календарные дни)'"/>
												<xsl:with-param name="width" select="'40mm'"/>
											</xsl:call-template>
											<xsl:text> не превышающий срок, определяемый в соответствии с пунктом 3 статьи 144 Таможенного кодекса Евразийского экономического союза*.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:choose>
												<xsl:when test="oct:ResidentKind = '1' or oct:ResidentKind = '2' or oct:ResidentKind = '3'">
													<xsl:text>Обязуюсь при изменении условий перевозки товаров от места их таможенного декларирования и выпуска в соответствии с таможенной процедурой свободой таможенной зоны до территории участка не менее чем за 10 рабочих дней до подачи декларации на товары на партию ввозимых товаров, перевозка которых и размещение на участке будут осуществляться на новых условиях, уведомить об этом таможенный орган путем подачи нового обязательства.</xsl:text>
												</xsl:when>
												<xsl:when test="oct:ResidentKind = '4'">
													<xsl:text>Обязуюсь при изменении условий перевозки иностранных товаров от места их таможенного декларирования в соответствии с таможенной процедурой свободой таможенной зоны до территории участка не менее чем за 10 рабочих дней до подачи декларации на товары на партию ввозимых иностранных товаров, перевозка которых и размещение на участке будут осуществляться на новых условиях, уведомить об этом таможенный орган путем подачи нового обязательства.</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Обязуюсь при изменении условий перевозки товаров от места их таможенного декларирования и выпуска в соответствии с таможенной процедурой свободой таможенной зоны до территории участка не менее чем за 10 рабочих дней до подачи декларации на товары на партию ввозимых товаров, перевозка которых и размещение на участке будут осуществляться на новых условиях, уведомить об этом таможенный орган путем подачи нового обязательства.</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
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
											<table>
												<tbody>
													<tr valign="bottom">
														<td align="left" width="60%">
															<xsl:text>Дата подачи настоящего обязательства</xsl:text>
														</td>
														<td align="center" class="value" width="40%">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="oct:ObligationsDate"/>
															</xsl:call-template>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">(день, месяц, год)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr valign="bottom">
														<td align="center" class="value" width="40%">
															<xsl:apply-templates select="oct:Resident/cat_ru:OrganizationName"/>
														</td>
														<td width="7%"/>
														<td class="value" width="16%"/>
														<td width="7%"/>
														<td align="center" class="value" width="30%">
															<xsl:apply-templates mode="PersonBase" select="oct:ResidentSignature"/>
														</td>
													</tr>
													<tr>
														<td class="graphLittle">
															<xsl:choose>
																<xsl:when test="oct:ResidentKind = '1'">
																	<xsl:text>(резидент территории опережающего развития)</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '2'">
																	<xsl:text>(резидент свободного порта Владивосток)</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '3'">
																	<xsl:text>(резидент Арктической зоны Российской Федерации)</xsl:text>
																</xsl:when>
																<xsl:when test="oct:ResidentKind = '4'">
																	<xsl:text>(участник свободной экономической зоны)</xsl:text>
																</xsl:when>
															</xsl:choose>
														</td>
														<td/>
														<td class="graphLittle">(подпись)</td>
														<td/>
														<td class="graphLittle">(фамилия, имя, отчество (при наличии))</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<br/>
							<div class="descr" style="text-align:left;">
								<xsl:text>* Приложение № 1 к Договору о Таможенном кодексе Евразийского экономического союза (официальный сайт Евразийского экономического союза http://www.eaeunion.org/, 12 апреля 2017 г.; является обязательным для Российской Федерации в соответствии с Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза"; вступил в силу для Российской Федерации 1 января 2018 г.</xsl:text>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					
				</div>
			</body>
		</html>
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
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
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
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
					<xsl:text>(срок действия: до   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
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
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
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
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
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
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="oct:ResidentCertificate">
			<xsl:text> свидетельство  </xsl:text>
			<xsl:for-each select="oct:ResidentCertificate">
				<xsl:apply-templates select="." mode="Certificate"/>
				<xsl:if test="position()!=last()">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
