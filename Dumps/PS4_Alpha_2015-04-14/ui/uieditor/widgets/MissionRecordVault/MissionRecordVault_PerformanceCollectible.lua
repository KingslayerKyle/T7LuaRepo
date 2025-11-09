require( "ui.uieditor.widgets.BorderThin" )

CoD.MissionRecordVault_PerformanceCollectible = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_PerformanceCollectible.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_PerformanceCollectible )
	self.id = "MissionRecordVault_PerformanceCollectible"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 110 )
	
	local questionmark = LUI.UIImage.new()
	questionmark:setLeftRight( true, true, 0, 0 )
	questionmark:setTopBottom( true, true, 0, 0 )
	questionmark:setRGB( 0.79, 0.79, 0.79 )
	questionmark:setImage( RegisterImage( "uie_t7_menu_cp_vault_questionmark" ) )
	questionmark:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( questionmark )
	self.questionmark = questionmark
	
	local BorderThin = CoD.BorderThin.new( menu, controller )
	BorderThin:setLeftRight( true, true, 2, -2 )
	BorderThin:setTopBottom( true, true, 2, -2 )
	BorderThin:setRGB( 0.79, 0.79, 0.79 )
	self:addElement( BorderThin )
	self.BorderThin = BorderThin
	
	self.close = function ( self )
		self.BorderThin:close()
		CoD.MissionRecordVault_PerformanceCollectible.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

