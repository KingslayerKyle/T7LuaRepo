require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemAuthor" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemPublishedTime" )
require( "ui.uieditor.widgets.FileShare.FileshareStat" )

CoD.FileshareSelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.FileshareSelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectedItemInfo )
	self.id = "FileshareSelectedItemInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 418 )
	self:setTopBottom( true, false, 0, 84 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 418 )
	BG:setTopBottom( true, false, 0, 53 )
	BG:setRGB( 0.18, 0.18, 0.18 )
	BG:setAlpha( 0.75 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareSelectedItemAuthor0 = CoD.FileshareSelectedItemAuthor.new( menu, controller )
	FileshareSelectedItemAuthor0:setLeftRight( true, false, 4, 267 )
	FileshareSelectedItemAuthor0:setTopBottom( true, false, 1.5, 26.5 )
	FileshareSelectedItemAuthor0:linkToElementModel( self, "fileAuthorName", true, function ( model )
		local fileAuthorName = Engine.GetModelValue( model )
		if fileAuthorName then
			FileshareSelectedItemAuthor0.AuthorName:setText( Engine.Localize( fileAuthorName ) )
		end
	end )
	self:addElement( FileshareSelectedItemAuthor0 )
	self.FileshareSelectedItemAuthor0 = FileshareSelectedItemAuthor0
	
	local FileshareSelectedItemPublishedTime0 = CoD.FileshareSelectedItemPublishedTime.new( menu, controller )
	FileshareSelectedItemPublishedTime0:setLeftRight( true, false, 4, 269 )
	FileshareSelectedItemPublishedTime0:setTopBottom( true, false, 31, 56 )
	FileshareSelectedItemPublishedTime0:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local fileCreateTime = Engine.GetModelValue( model )
		if fileCreateTime then
			FileshareSelectedItemPublishedTime0.PublishTime:setText( Engine.Localize( fileCreateTime ) )
		end
	end )
	self:addElement( FileshareSelectedItemPublishedTime0 )
	self.FileshareSelectedItemPublishedTime0 = FileshareSelectedItemPublishedTime0
	
	local StatLikes = CoD.FileshareStat.new( menu, controller )
	StatLikes:setLeftRight( true, false, 0, 100 )
	StatLikes:setTopBottom( true, false, 56, 74 )
	StatLikes.TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	self:addElement( StatLikes )
	self.StatLikes = StatLikes
	
	local StatDislikes = CoD.FileshareStat.new( menu, controller )
	StatDislikes:setLeftRight( true, false, 106, 206 )
	StatDislikes:setTopBottom( true, false, 56, 74 )
	StatDislikes.TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	self:addElement( StatDislikes )
	self.StatDislikes = StatDislikes
	
	local StatViews = CoD.FileshareStat.new( menu, controller )
	StatViews:setLeftRight( true, false, 213, 313 )
	StatViews:setTopBottom( true, false, 56, 74 )
	StatViews.TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	self:addElement( StatViews )
	self.StatViews = StatViews
	
	local StatDownloads = CoD.FileshareStat.new( menu, controller )
	StatDownloads:setLeftRight( true, false, 318, 418 )
	StatDownloads:setTopBottom( true, false, 56, 74 )
	StatDownloads.TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	self:addElement( StatDownloads )
	self.StatDownloads = StatDownloads
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectedItemAuthor0:close()
		element.FileshareSelectedItemPublishedTime0:close()
		element.StatLikes:close()
		element.StatDislikes:close()
		element.StatViews:close()
		element.StatDownloads:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

