-- 9d3eb2f0e1ab22e55e9cde75f3cbea57
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_CommunityButton_TitleAndDesc = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_CommunityButton_TitleAndDesc.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_CommunityButton_TitleAndDesc )
	self.id = "BM_Contracts_CommunityButton_TitleAndDesc"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 234 )
	self:setTopBottom( true, false, 0, 18 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local SpecialContractName = LUI.UIText.new()
	SpecialContractName:setLeftRight( true, false, 0, 233.5 )
	SpecialContractName:setTopBottom( true, false, 0, 18.5 )
	SpecialContractName:setRGB( 0.46, 0.8, 0.75 )
	SpecialContractName:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_CONTRACT_ZMHD_TITLE" ) )
	SpecialContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialContractName:setLetterSpacing( -0.5 )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( SpecialContractName, "setText", function ( element, controller )
		UpdateWidgetHeightToMultilineText( self, element, 0 )
	end )
	self:addElement( SpecialContractName )
	self.SpecialContractName = SpecialContractName
	
	local SpecialContractDesc = LUI.UIText.new()
	SpecialContractDesc:setLeftRight( true, false, 0, 233.5 )
	SpecialContractDesc:setTopBottom( false, true, 1, 19 )
	SpecialContractDesc:setRGB( 0.88, 0.88, 0.88 )
	SpecialContractDesc:setText( "" )
	SpecialContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractDesc )
	self.SpecialContractDesc = SpecialContractDesc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "Focus"
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "Focus"
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

