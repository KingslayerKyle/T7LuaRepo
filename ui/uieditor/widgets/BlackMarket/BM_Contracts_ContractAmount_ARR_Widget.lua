-- 6cd44176b9d1d0d63a9418cc88e3c56e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Common.common_PanelBox01" )

CoD.BM_Contracts_ContractAmount_ARR_Widget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_ContractAmount_ARR_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_ContractAmount_ARR_Widget )
	self.id = "BM_Contracts_ContractAmount_ARR_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 205 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 2.5, -1.2 )
	BoxButtonLrgInactive:setTopBottom( true, true, 6, -6.5 )
	BoxButtonLrgInactive:setAlpha( 0.15 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Numberbacker = LUI.UIImage.new()
	Numberbacker:setLeftRight( false, true, -94.25, -38.25 )
	Numberbacker:setTopBottom( true, false, 8.5, 72.5 )
	Numberbacker:setImage( RegisterImage( "uie_t7_blackmarket_contract_numberbacking" ) )
	self:addElement( Numberbacker )
	self.Numberbacker = Numberbacker
	
	local GoldContracts = LUI.UIImage.new()
	GoldContracts:setLeftRight( true, false, 27, 107 )
	GoldContracts:setTopBottom( true, false, 0, 80 )
	GoldContracts:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_green" ) )
	self:addElement( GoldContracts )
	self.GoldContracts = GoldContracts
	
	local SilverContracts = LUI.UIImage.new()
	SilverContracts:setLeftRight( true, false, 27, 107 )
	SilverContracts:setTopBottom( true, false, 0, 80 )
	SilverContracts:setAlpha( 0 )
	SilverContracts:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_max" ) )
	self:addElement( SilverContracts )
	self.SilverContracts = SilverContracts
	
	local ContractCounter0 = LUI.UIText.new()
	ContractCounter0:setLeftRight( false, true, -100.25, -34.25 )
	ContractCounter0:setTopBottom( true, false, 18, 63 )
	ContractCounter0:setRGB( 0.93, 0.69, 0.35 )
	ContractCounter0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	ContractCounter0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ContractCounter0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ContractCounter0:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			ContractCounter0:setText( Engine.Localize( StorageLookup( controller, "blackjack_contract_count", statsMp ) ) )
		end
	end )
	self:addElement( ContractCounter0 )
	self.ContractCounter0 = ContractCounter0
	
	local TextBoxMax = LUI.UIText.new()
	TextBoxMax:setLeftRight( false, true, -103.75, -30.75 )
	TextBoxMax:setTopBottom( true, false, 47.5, 66.5 )
	TextBoxMax:setRGB( 0.61, 0.1, 0.1 )
	TextBoxMax:setAlpha( 0 )
	TextBoxMax:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
	TextBoxMax:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TextBoxMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBoxMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxMax )
	self.TextBoxMax = TextBoxMax
	
	local commonPanelBox02 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox02:setLeftRight( true, true, 2.5, -1.2 )
	commonPanelBox02:setTopBottom( true, true, 5.5, -6.5 )
	commonPanelBox02.Backing:setAlpha( 0.05 )
	commonPanelBox02.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox02 )
	self.commonPanelBox02 = commonPanelBox02
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Max = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ContractCounter0:completeAnimation()
				self.ContractCounter0:setLeftRight( false, true, -100.25, -34.25 )
				self.ContractCounter0:setTopBottom( true, false, 14, 59 )
				self.clipFinished( ContractCounter0, {} )
				TextBoxMax:completeAnimation()
				self.TextBoxMax:setLeftRight( false, true, -103.75, -30.75 )
				self.TextBoxMax:setTopBottom( true, false, 46.5, 65.5 )
				self.TextBoxMax:setAlpha( 1 )
				self.clipFinished( TextBoxMax, {} )
			end
		},
		None = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				GoldContracts:completeAnimation()
				self.GoldContracts:setAlpha( 0 )
				self.clipFinished( GoldContracts, {} )
				SilverContracts:completeAnimation()
				self.SilverContracts:setAlpha( 1 )
				self.clipFinished( SilverContracts, {} )
				ContractCounter0:completeAnimation()
				self.ContractCounter0:setRGB( 0.4, 0.4, 0.4 )
				self.clipFinished( ContractCounter0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.commonPanelBox02:close()
		element.ContractCounter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

