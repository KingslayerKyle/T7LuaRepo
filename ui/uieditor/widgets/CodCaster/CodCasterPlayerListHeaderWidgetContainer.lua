-- 092f3f776852367a4b3e0aeaec1a579b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerListHeaderWidget" )

CoD.CodCasterPlayerListHeaderWidgetContainer = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListHeaderWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerListHeaderWidgetContainer )
	self.id = "CodCasterPlayerListHeaderWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 325 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local Header = CoD.CodCasterPlayerListHeaderWidget.new( menu, controller )
	Header:setLeftRight( false, true, -312, 0 )
	Header:setTopBottom( true, false, 0, 24 )
	Header.whiteBG:setRGB( 0.27, 0.27, 0.27 )
	Header.TeamName:setText( Engine.Localize( "Team Name" ) )
	self:addElement( Header )
	self.Header = Header
	
	local ListenIn = LUI.UIImage.new()
	ListenIn:setLeftRight( false, true, -329, -315 )
	ListenIn:setTopBottom( true, false, 5, 19 )
	ListenIn:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	self:addElement( ListenIn )
	self.ListenIn = ListenIn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Header:completeAnimation()
				self.Header:setAlpha( 0 )
				self.clipFinished( Header, {} )
				ListenIn:completeAnimation()
				self.ListenIn:setAlpha( 0 )
				self.clipFinished( ListenIn, {} )
			end
		},
		VisibleSelectedTeam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Header:completeAnimation()
				Header.whiteBG:completeAnimation()
				Header.whiteBGAccent2:completeAnimation()
				Header.whiteBGcolor:completeAnimation()
				self.Header.whiteBG:setAlpha( 0 )
				self.Header.whiteBGAccent2:setAlpha( 0.5 )
				self.Header.whiteBGcolor:setAlpha( 0.7 )
				self.clipFinished( Header, {} )
				ListenIn:completeAnimation()
				self.ListenIn:setAlpha( 0 )
				self.clipFinished( ListenIn, {} )
			end
		},
		VisibleSelectedTeamWithListenIn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Header:completeAnimation()
				Header.whiteBG:completeAnimation()
				Header.whiteBGAccent2:completeAnimation()
				Header.whiteBGcolor:completeAnimation()
				self.Header.whiteBG:setAlpha( 0 )
				self.Header.whiteBGAccent2:setAlpha( 0.5 )
				self.Header.whiteBGcolor:setAlpha( 0.7 )
				self.clipFinished( Header, {} )
				ListenIn:completeAnimation()
				self.ListenIn:setAlpha( 1 )
				self.clipFinished( ListenIn, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Header:completeAnimation()
				Header.whiteBG:completeAnimation()
				Header.whiteBGAccent2:completeAnimation()
				Header.whiteBGcolor:completeAnimation()
				self.Header:setAlpha( 1 )
				self.Header.whiteBG:setAlpha( 0.7 )
				self.Header.whiteBGAccent2:setAlpha( 0 )
				self.Header.whiteBGcolor:setAlpha( 0 )
				self.clipFinished( Header, {} )
				ListenIn:completeAnimation()
				self.ListenIn:setAlpha( 0 )
				self.clipFinished( ListenIn, {} )
			end
		},
		VisibleWithListenIn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Header:completeAnimation()
				Header.whiteBG:completeAnimation()
				Header.whiteBGAccent2:completeAnimation()
				Header.whiteBGcolor:completeAnimation()
				self.Header:setAlpha( 1 )
				self.Header.whiteBG:setAlpha( 0.7 )
				self.Header.whiteBGAccent2:setAlpha( 0 )
				self.Header.whiteBGcolor:setAlpha( 0 )
				self.clipFinished( Header, {} )
				ListenIn:completeAnimation()
				self.ListenIn:setAlpha( 1 )
				self.clipFinished( ListenIn, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

