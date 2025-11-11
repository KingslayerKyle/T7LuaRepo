require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorLoadoutWheel" )

CoD.freeCursorLoadout = InheritFrom( LUI.UIElement )
CoD.freeCursorLoadout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorLoadout )
	self.id = "freeCursorLoadout"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 209 )
	self.anyChildUsesUpdateState = true
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0.05, 0.15, 0.11 )
	BlackBG2:setAlpha( 0.98 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0.95, 10, 10 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.05, 0.15, 0.11 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Loadout = CoD.freeCursorLoadoutWheel.new( menu, controller )
	Loadout:setLeftRight( 0.5, 0.5, -169, 169 )
	Loadout:setTopBottom( 0.04, 0.04, -6, 197 )
	Loadout:linkToElementModel( self, nil, false, function ( model )
		Loadout:setModel( model, controller )
	end )
	self:addElement( Loadout )
	self.Loadout = Loadout
	
	self.resetProperties = function ()
		BlackBG2:completeAnimation()
		Loadout:completeAnimation()
		BlackBG2:setAlpha( 0.98 )
		Loadout:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setAlpha( 0 )
				self.clipFinished( BlackBG2, {} )
				Loadout:completeAnimation()
				self.Loadout:setAlpha( 0 )
				self.clipFinished( Loadout, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Hidden" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "DefaultState" ) then
			ExpandFreeCursorElement( self )
		else
			CollapseFreeCursorElement( self )
		end
	end )
	self:linkToElementModel( self, "loadout", true, function ( model )
		local element = self
		if IsSelfModelValueGreaterThanOrEqualTo( element, controller, "loadout", 0 ) then
			SetState( self, "DefaultState" )
		else
			SetState( self, "Hidden" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Loadout:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

