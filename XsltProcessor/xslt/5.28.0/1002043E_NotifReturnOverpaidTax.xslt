<?xml version="1.0" encoding="utf-8"?>
<!-- Проект Приказа ФТС России (от 22 января 2019 г. № 87) "Об утверждении формы уведомления о возврате (зачете) излишне уплаченных или излишне взысканных сумм таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные органы, а также порядка направления такого уведомления" Приложение №1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nrot="urn:customs.ru:Information:CommercialFinanceDocuments:NotifReturnOverpaidTax:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа NotifReturnOverpaidTaxType -->
	<xsl:template match="nrot:NotifReturnOverpaidTax">
		<xsl:param name="w" select="200"/>
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
                  font-style: Italic;
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

					.delim_3 {
					height: 3pt;
					}	
					
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title" colspan="3">
									<font size="3">
										<b>Уведомление<br/>о возврате (зачете) излишне уплаченных или излишне<br/>взысканных сумм таможенных пошлин, налогов, таможенных<br/>пошлин и (или) внутренних налогов в отношении товаров электронной<br/>торговли и иных платежей, взимание которых возложено<br/>на таможенные органы Российской Федерации</b>
									</font>
								</td>
							</tr>
							<tr>
								<td><br/></td>
							</tr>
							<tr>
								<td align="center" width="20%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="nrot:Date"/>
									</xsl:call-template>
								</td>
								<td align="right" width="40%">
									<xsl:text>№ </xsl:text>
								</td>
								<td align="center" width="40%" class="value">
									<xsl:value-of select="nrot:RegNumber"/>
								</td>
							</tr>
							<tr>
								<td class="descr">(дата уведомления)</td>
								<td></td>
								<td class="descr">(номер уведомления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Таможенный орган Российской Федерации</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="nrot:Customs"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименоваие таможенного органа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>уведомляет</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="nrot:Organization" mode="org"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование юридического лица; фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="nrot:RefundOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text>ИНН - </xsl:text>
													<xsl:value-of select="nrot:RefundOrganization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</xsl:when>
												<xsl:when test="nrot:RefundOrganization/nrot:TaxNumber">
													<xsl:if test="nrot:RefundOrganization/nrot:TaxNumber/RUScat_ru:CountryCode">
														<xsl:value-of select="nrot:RefundOrganization/nrot:TaxNumber/RUScat_ru:CountryCode"/>
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:text>рег. номер - </xsl:text>
													<xsl:value-of select="nrot:RefundOrganization/nrot:TaxNumber/RUScat_ru:UITNCode"/>
												</xsl:when>
												<xsl:when test="nrot:RefundOrganization/nrot:IdentityCard">
													<xsl:value-of select="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardName"/>
													<xsl:if test="not(nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardName)">
														<xsl:value-of select="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:FullIdentityCardName"/>
													</xsl:if>
													<xsl:if test="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardSeries">
														<xsl:text> серия - </xsl:text>
														<xsl:value-of select="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardSeries"/>
													</xsl:if>
													<xsl:if test="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardNumber">
														<xsl:text> номер - </xsl:text>
														<xsl:value-of select="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:IdentityCardNumber"/>
													</xsl:if>
													<xsl:if test="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:CountryCode">
														<xsl:text> страна выдачи - </xsl:text>
														<xsl:value-of select="nrot:RefundOrganization/nrot:IdentityCard/RUScat_ru:CountryCode"/>
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(сведения о лице, на лицевой счет которого произведен зачет денежных средств, либо налогоплательщика: в отношении лиц, состоящих на учете в налоговых органах Российской Федерации, - идентификационный номер налогоплательщика; в отношении юридических лиц и индивидуальных предпринимателей, не состоящих на учете в налоговых органах Российской Федерации, - наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации; в отношении физических лиц, не состоящих на учете в налоговых органах Российской Федерации, - наименование, серия, номер, страна выдачи документа, удостоверяющего личность)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<!--tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="5%">
													<xsl:text>ИНН</xsl:text>
													<sup>*</sup>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="nrot:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</td>
												<td width="5%">
													<xsl:text>КПП</xsl:text>
													<sup>**</sup>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="nrot:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr-->
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<xsl:text>о возврате (зачете) излишне уплаченных или излишне взысканных сумм таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные органы, исчисленных</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="nrot:DocCalcPayment"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(документ, подтверждающий факт излишней уплаты или излишнего взыскания таможенных пошлин, налогов, таможенных пошлин, внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых возложено на таможенные органы)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
									<br/>
									<xsl:text>в форме их зачета </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="nrot:OffsetDetails/nrot:OffsetDate"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указывается дата зачета)'"/>
										<xsl:with-param name="width" select="'70mm'"/>
									</xsl:call-template>
									<xsl:choose>
										<xsl:when test="nrot:OffsetDetails/nrot:OffsetIndicator='0'">
											<xsl:text> на лицевой счет </xsl:text>
										</xsl:when>
										<xsl:when test="nrot:OffsetDetails/nrot:OffsetIndicator='1'">
											<xsl:text> в счет авансовых платежей </xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="nrot:RefundOrganization/nrot:DeclarantEqualFlag = 1 or nrot:RefundOrganization/nrot:DeclarantEqualFlag='true'">
													<xsl:apply-templates select="nrot:Organization" mode="org"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="nrot:RefundOrganization" mode="org"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указывается наименование юридического лица; фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="supIndexDescr" select="'***'"/>
									</xsl:call-template>
									<xsl:text>в сумме </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="translate(translate(format-number(nrot:Amount, '#,###.00'), ',', ' '), '.', ',')"/>
											<xsl:text> (</xsl:text>
											<xsl:apply-templates mode="sumWords" select="nrot:Amount"/>
											<xsl:text>)</xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(цифрами, прописью)'"/>
										<xsl:with-param name="width" select="'99%'"/>
									</xsl:call-template>
									<br/>
									<br/>
									<xsl:text>Информируем, что в связи с неправомерным взысканием таможенных пошлин, налогов, таможенных пошлин и (или) внутренних налогов в отношении товаров электронной торговли и иных платежей, взимание которых вызложено на таможенные органы</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="nrot:RefundOrganization/nrot:DeclarantEqualFlag = 1 or nrot:RefundOrganization/nrot:DeclarantEqualFlag='true'">
													<xsl:apply-templates select="nrot:Organization" mode="org"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="nrot:RefundOrganization" mode="org"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указывается наименование юридического лица; фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
										<xsl:with-param name="width" select="'99%'"/>
									</xsl:call-template>
									<xsl:text>,</xsl:text>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="nrot:PercentAmount">
											<xsl:text>подлежат выплате проценты в сумме</xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="translate(translate(format-number(nrot:PercentAmount, '#,###.00'), ',', ' '), '.', ',')"/>
													<xsl:text> (</xsl:text>
													<xsl:apply-templates mode="sumWords" select="nrot:PercentAmount"/>
													<xsl:text>)</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="description" select="'(цифрами, прописью)'"/>
												<xsl:with-param name="width" select="'100%'"/>
												<xsl:with-param name="supIndexData" select="'****'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<table>
												<tbody>
													<tr>
														<td colspan="2">
															<xsl:text>подлежат выплате проценты в сумме ______ рублей ____ копеек****</xsl:text>
														</td>
													</tr>
													<tr>
														<td align="right" style="font-size: 8pt;" width="70%">
															<xsl:text>(цифрами, прописью)</xsl:text>
														</td>
														<td width="30%"/>
													</tr>
												</tbody>
											</table>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="44%">
									Начальник
									<br/>
									таможенного органа
									<br/>
									(лицо, его замещающее)
								</td>
								<td width="3%"/>
								<td width="15%" class="value"/>
								<td width="3%"/>
								<td width="35%" class="value" align="center" valign="bottom">
									<xsl:text>(</xsl:text>
									<xsl:apply-templates select="nrot:CustomsChief/cat_ru:PersonName" mode="initials"/>
									<xsl:apply-templates select="nrot:CustomsChief/cat_ru:PersonMiddleName" mode="initials"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="nrot:CustomsChief/cat_ru:PersonSurname"/>
									<xsl:text>)</xsl:text>
								</td>
							</tr>
							<tr>
								<td/>
								<td/>
								<td class="descr">(подпись)</td>
								<td/>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
					<!--br/>
					<p align="left" style="font-size: 8pt;">
						____________________________________
						<br/>
						<sup>*</sup> Идентификационный номер налогоплательщика.
						<br/>
						<sup>**</sup> Указывается код причины постановки на учет юридического лица, содержащийся в Едином государственном реестре юридических лиц.
						<br/>
						<sup>***</sup> Указывается лицо, на лицевой счет которого был произведен зачет денежных средств.
						<br/>
						<sup>****</sup> Заполняется в случае обнаружения факта излишнего взыскания таможенных пошлин, налогов и иных платежей, взимание которых возложено на таможенные органы.
					</p-->
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="sumWords" match="*">
		<xsl:variable name="splittedSum">
			<xsl:value-of select="translate(.,'.',',')"/>
		</xsl:variable>
		<xsl:variable name="integerPart">
			<xsl:choose>
				<xsl:when test="substring-before($splittedSum,',')!=''">
					<xsl:value-of select="substring-before($splittedSum,',')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$splittedSum"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
		<xsl:choose>
			<xsl:when test="$integerPart!='0'">
				<xsl:call-template name="RecurseSumWords">
					<xsl:with-param name="Value" select="$integerPart"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
		<xsl:text> руб. </xsl:text>
		<xsl:if test="$fractionalPart!=''">
			<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
			<xsl:text> коп.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="nrot:DocCalcPayment">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="nrot:DocKind"/>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
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
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="nrot:Customs">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:OfficeName"/>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="." />
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()" />
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath" />
	</xsl:template>
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(.,1, 1),'.')"/>
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
