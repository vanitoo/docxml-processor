<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:loa="urn:customs.ru:Information:CommercialFinanceDocuments:LetterOfAttorney:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template match="//*[local-name()='LetterOfAttorney']//*" priority="-1">
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="loa:LetterOfAttorney">
		<xsl:variable name="xpath_docName">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="loa:DocumentReference/cat_ru:PrDocumentName"/>
			</xsl:call-template>
		</xsl:variable>
	   <xsl:variable name="docName">
		   <xsl:choose>
				<xsl:when test="loa:DocumentReference/cat_ru:PrDocumentName or loa:DocumentReference/cat_ru:PrDocumentName!=''">
					<xsl:apply-templates select="loa:DocumentReference/cat_ru:PrDocumentName"/>
				</xsl:when>
				<xsl:otherwise>ДОВЕРЕННОСТЬ</xsl:otherwise>
			</xsl:choose>
	   </xsl:variable>
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<element xml_node="{$xpath_docName}">
				<title><xsl:value-of select="$docName"/></title>
			</element>
            <style type="text/css">
					body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
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
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
				   <h2><element xml_node="{$xpath_docName}"><xsl:value-of select="$docName"/></element><br/>№ <xsl:apply-templates select="loa:DocumentReference/cat_ru:PrDocumentNumber"/>
				   </h2>
               <table width="100%">
                  <tr>
                     <td align="right" class="value" colspan="3" width="100%">
						<xsl:apply-templates select="loa:DocumentReference/cat_ru:PrDocumentDate" mode="russian_date"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="left" class="value" colspan="3" width="100%">
                        <xsl:apply-templates select="loa:Organization"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="left" class="value" colspan="3" width="100%">
                        <xsl:for-each select="loa:Subject">
                           <xsl:apply-templates select="."/>
                           <xsl:text> </xsl:text>
                        </xsl:for-each>
                        <br/>
							Доверенное лицо:
							<xsl:apply-templates select="loa:EmpoweredPerson/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="loa:EmpoweredPerson/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="loa:EmpoweredPerson/cat_ru:PersonMiddleName"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:if test="loa:EmpoweredPerson/cat_ru:PersonPost">
                           <xsl:apply-templates select="loa:EmpoweredPerson/cat_ru:PersonPost"/>
                        </xsl:if>
                        <br/>	
							Документ, удостоверяющий личность доверенного лица:
							<xsl:apply-templates select="loa:EmpoweredPerson/loa:Passport"/>
                     </td>
                  </tr>
                  <xsl:if test="loa:TypeOfAttorney">
					<tr>
						<td align="left" class="value" colspan="3" width="100%">
							Тип документа, удостоверящий полномочия лица:
							<xsl:apply-templates select="loa:TypeOfAttorney"/>
						</td>
					</tr>
				  </xsl:if>
                  <tr>
                     <td align="left" class="value" colspan="3" width="100%">
							Дата окончания действий полномочий:  
						<xsl:apply-templates select="loa:EndDate" mode="russian_date"/>
                     </td>
                  </tr>
                  <xsl:if test="loa:AuthoritiesDocument">
                     <tr>
                        <td align="left" class="value" colspan="3" width="100%">
							Документ, подтверждающий полномочия должностного лица организации-доверителя 
								<xsl:if test="loa:AuthoritiesDocument/cat_ru:PrDocumentName">
                              <xsl:apply-templates select="loa:AuthoritiesDocument/cat_ru:PrDocumentName"/>
                           </xsl:if>
                           <xsl:if test="loa:AuthoritiesDocument/cat_ru:PrDocumentNumber">	
									№ <xsl:apply-templates select="loa:AuthoritiesDocument/cat_ru:PrDocumentNumber"/>
                           </xsl:if>
                           <xsl:if test="loa:AuthoritiesDocument/cat_ru:PrDocumentDate">
								от <xsl:apply-templates select="loa:AuthoritiesDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
                           </xsl:if>
                           <xsl:if test="loa:AuthoritiesDocument/cat_ru:ComplationAuthorityDate">
                              <br/>
								Дата окончания полномочий <xsl:apply-templates select="loa:AuthoritiesDocument/cat_ru:ComplationAuthorityDate" mode="russian_date"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <br/>
                  <tr>
                     <td class="value" width="30%">
                        <xsl:if test="loa:PersonSignature/cat_ru:IssueDate">
                           <xsl:apply-templates select="loa:PersonSignature/cat_ru:IssueDate" mode="russian_date"/>
                        </xsl:if>
                     </td>
                     <td class="value" width="35%">
                        <xsl:if test="loa:PersonSignature/cat_ru:PersonPost">
                           <xsl:apply-templates select="loa:PersonSignature/cat_ru:PersonPost"/>
                        </xsl:if>
                     </td>
                     <td class="value" width="35%">
                        <xsl:apply-templates select="loa:PersonSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="loa:PersonSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="loa:PersonSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
  <xsl:template match="loa:Passport">
      <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      <xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
      <xsl:text>, </xsl:text>
      <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="loa:Passport/*">
      <xsl:if test="preceding-sibling::*[1]">
		    <xsl:choose>
				<xsl:when test="local-name(.)='IdentityCardNumber'"><xsl:text> </xsl:text></xsl:when>
				<xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
			</xsl:choose>
      </xsl:if>
		<xsl:variable name="xpath_Passport">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_Passport}">
		  <xsl:value-of select="."/>
		</element>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cat_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
		<xsl:variable name="xpath_address">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_address}">
			<xsl:value-of select="."/>
		</element>
   </xsl:template>
   <xsl:template match="loa:OrganizationPerson">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="loa:OrganizationPerson/*">
      <xsl:if test="preceding-sibling::*[1]"><xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text></xsl:if>
		<xsl:variable name="xpath_OrganizationPerson">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_OrganizationPerson}">
			<xsl:value-of select="."/>
		</element>
   </xsl:template>
   <xsl:template match="loa:Organization ">
	Сведения об организации
			<xsl:apply-templates select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:apply-templates select="./cat_ru:ShortName"/>)
		</xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Address">
         <xsl:apply-templates select="./cat_ru:Address"/>
         <br/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Phone">
			тел. <xsl:apply-templates select="cat_ru:Contact/cat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Fax">
			факс <xsl:apply-templates select="cat_ru:Contact/cat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact/cat_ru:Telex">
			телекс <xsl:apply-templates select="cat_ru:Contact/cat_ru:Telex"/>
      </xsl:if>
      <xsl:if test="./cat_ru:OKPOID">
         <br/>
			Код организации по ОКПО <xsl:apply-templates select="./cat_ru:OKPOID"/>
      </xsl:if>
      <xsl:if test="./cat_ru:OKATOCode">
			Код организации по ОКАТО <xsl:apply-templates select="./cat_ru:OKATOCode"/>
      </xsl:if>
      <br/>
      <!--xsl:if test="./cat_ru:BankInformation">
			Информация о банковских счетах:
				<xsl:for-each select="./cat_ru:BankInformation">
					№ <xsl:apply-templates select="./cat_ru:BankAccount"/>
						<xsl:if test="./cat_ru:BankAccountDescription">
						Тип счета <xsl:apply-templates select="./cat_ru:BankAccountDescription"/>
						</xsl:if>
					Название банка <xsl:apply-templates select="./cat_ru:BankName"/>	
					<xsl:if test="./cat_ru:BankMFO">
						МФО банка <xsl:apply-templates select="./cat_ru:BankMFO"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:if-->
      <xsl:if test="./loa:OrganizationPerson">
         <xsl:apply-templates select="./loa:OrganizationPerson"/>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
