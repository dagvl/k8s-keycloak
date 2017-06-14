<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:is="urn:jboss:domain:infinispan:4.0"
                xmlns:jboss="urn:jboss:domain:4.0"
                xmlns:ut="urn:jboss:domain:undertow:3.0">

    <xsl:output method="xml" indent="yes"/>

    <!-- set replication factor on keycloak caches -->
    <xsl:template match="is:subsystem/is:cache-container[@name='keycloak']/is:distributed-cache/@owners">
        <xsl:attribute name="owners">
            <xsl:text>${env.CACHE_REPLICATION_FACTOR:2}</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <!-- set binding ip for public port -->
    <xsl:template match="jboss:interfaces/jboss:interface[@name='public']/jboss:inet-address/@value">
        <xsl:attribute name="value">
            <xsl:text>${env.POD_IP:127.0.0.1}</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <!-- set binding ip for private port -->
    <xsl:template match="jboss:interfaces/jboss:interface[@name='private']/jboss:inet-address/@value">
        <xsl:attribute name="value">
            <xsl:text>${env.POD_IP:127.0.0.1}</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <!-- handle proxies -->
    <xsl:template match="ut:subsystem/ut:server[@name='default-server']/ut:http-listener[@name='default']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:attribute name="proxy-address-forwarding">
                <xsl:text>${env.PROXY_ADDRESS_FORWARDING}</xsl:text>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>


    <!-- identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
