CoD.BM_Contracts_ActiveArrow = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_ActiveArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_ActiveArrow )
	self.id = "BM_Contracts_ActiveArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 29 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0.14, 16.14 )
	left:setTopBottom( true, false, 0, 32 )
	left:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon2_left" ) )
	self:addElement( left )
	self.left = left
	
	local center = LUI.UIImage.new()
	center:setLeftRight( true, true, 16.14, -17.2 )
	center:setTopBottom( true, false, 0, 32 )
	center:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon2_center" ) )
	self:addElement( center )
	self.center = center
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -17.2, -1.2 )
	right:setTopBottom( true, false, 0, 32 )
	right:setImage( RegisterImage( "uie_t7_bm_contracts_active_ribbon2_right" ) )
	self:addElement( right )
	self.right = right
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 6.14, 61.8 )
	Text:setTopBottom( true, false, 5.5, 23.5 )
	Text:setRGB( 0, 0, 0 )
	Text:setText( Engine.Localize( "MPUI_ACTIVE_CAPS" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 10 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Cost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isComplete" )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSpecialContractActive( self, element, controller )
			end
		},
		{
			stateName = "Cost",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "cost" )
			end
		}
	} )
	self:linkToElementModel( self, "isComplete", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isComplete"
		} )
	end )
	self:linkToElementModel( self, "cost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

